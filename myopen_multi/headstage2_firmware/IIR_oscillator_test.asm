#include "spi.h"
#include "nordic_regs.h"

#define LED_BLINK 0x0010            // blink LED
#define NEXT_CHANNEL 0x3f00         // Intan command CONVERT(63) -- convert next channel
#define SHIFT_BITS 1                // SPORT may configure for more than 16-bit read/write...compensate
#define NEXT_CHANNEL_SHIFTED 0x7e00 // =NEXT_CHANNEL << SHIFT_BITS

#define SAMPLE_SHIFT 5      // =SHIFT_BITS+4, to get sample down to 12-bits. 
#define COMMAND_SHIFT 9     // channel << 8=commands, command<<1=17 bit SPORT write

#define READ_40 0xe800  // sending 11_101000_00000000, get 00000000_01001001 (0x0049)
#define READ_41 0xe900  // sending 11_101001_00000000, get 00000000_01001110 (0x004e)
#define READ_42 0xea00  // sending 11_101010_00000000, get 00000000_01010100 (0x0054)
#define READ_43 0xeb00  // sending 11_101011_00000000, get 00000000_01000001 (0x0041)
#define READ_44 0xec00  // sending 11_101100_00000000, get 00000000_01001110 (0x004e)

// Intan register setup values
#define REG0  0x80de    // get back 0xffde
#define REG1  0x8102    // get back 0xff02
#define REG2  0x8204    // get back 0xff04
#define REG3  0x8300    // get back 0xff00

#define REG4              0x8480 // get back 0xff80 - no DSP, offset binary
#define REG4_DSP_UNSIGNED 0x8494 // get back 0xff94 - DSP, offset binary
#define REG4_DSP_SIGNED   0x84D4 // get back 0xffD4 - DSP, signed output
#define REG4_SIGNED       0x84C4 // get back 0xffC4 - no DSP, signed output

#define REG5  0x8500    // get back 0xff00
#define REG6  0x8600    // get back 0xff00
#define REG7  0x8700    // get back 0xff00

// Intan REG8-13, configured for [250Hz, 10kHz]
#define REG8  0x8811    // get back 0xff11. Changed from 0x8816 on 12/28/2015
#define REG9  0x8900    // get back 0xff00
#define REG10 0x8a10    // get back 0xff10. Changed from 0x8817 on 12/28/2015
#define REG11 0x8b00    // get back 0xff00
#define REG12 0x8c11    // get back 0xff11. Changed from 0x8815 on 12/28/2015
#define REG13 0x8d00    // get back 0xff00

#define REG14 0x8eff    // get back 0xffff
#define REG15 0x8fff    // get back 0xffff
#define REG16 0x90ff    // get back 0xffff
#define REG17 0x91ff    // get back 0xffff
#define CALIB 0x5500    // get back 0x8000

#define CONVERT0 0x0000

/*  Oscillator test: save the results from all samples due to oscillator at location
                     MEMBUFF=0xff806300, read out via JTAG
    MEMBUFF start from 0xff806300, end at 0xff807400.
    This allows for 2176 16-bit words, or 1088 32-bit words.

    One iteration saving from 1 amp = 32 16-bit words -> we have enough for 68 iterations.

    So 68 samples each, sampling freq=31250. This gives 2 periods if osc freq ~ 919Hz.
    This means the IIR coefficients are:

    b0=0, b1=0, a0=32768-573=32195, a1=-16384 (should give 935.6Hz).

    Also need to give the IIR memory slots: y2(n-2), y2(n-1),...etc nonzero values to start with.
 */
#define MEMBUFF 0xff806300
#define TOTAL_CALL_ASM 2176 // 68*32

.align 8    // call is a 5-cycle latency if target is aligned.
_get_asm:
    /* Sampling thread:
       Reads in data, apply offset removal/high-pass, AGC gain, LMS, and IIR.
       Clobbers almost all registers. But it's ok.
    */

    // Reset p0 to point to SPORT0_RX.
    p0 = [FP - FP_SPORT0_RX];
    
    /* When this thread first starts running, [FP_CHAN] = 30. This reg holds the
       current channel and is incremented before actually reading the samples.
       Therefore, after incrementing, this value will be the channel number corresponding
       to that being read out on MOSI.

       The SPORT pipeline is setup such that, when _get_asm is first executed, we have:
            FIFO: CONVERT(3)
            MOSI: CONVERT(2)
            ADC:  CONVERT(1)
            MISO: CONVERT(0) result.

       Thus the initial [FP_CHAN]=30 value is incremented to 31, corresponding with MISO result.

       After reading MISO, CONVERT(3) will need to be loaded, thus the channel to be loaded is
       FP_CHAN+4 (after FP_CHAN is already incremented).
    */
wait_samples_main:
    r3 = w[p0 + (SPORT1_STAT - SPORT0_RX)];
    cc = bittst(r3, 0);
    if !cc jump wait_samples_main;

    // we got samples back from MISO, new CONVERT command transmitted!
    // now increment the channel, and queue up new command
    r6 = [FP - FP_CHAN];
    r6 += 1;
    bitclr(r6, 5);          // roll back to 0 if it's 32
    [FP - FP_CHAN] = r6;

    /* Read in the samples. 
       Note the difference in channel organization between this version and Tim's headstages.
       Tim's board, amplifiers are connected, from left-to-right, looking from top of board as:
            SPORT0_PRI = Ch0-31
            SPORT0_SEC = Ch32-63
            SPORT1_PRI = Ch64-95
            SPORT1_SEC = Ch96-127
       
       This board:
            SPORT1_SEC = Ch0-31
            SPORT1_PRI = Ch32-63
            SPORT0_SEC = Ch64-95
            SPORT0_PRI = Ch96-127
        
       To minimize firmware changes, the order of reading SPORT ports have been changed -- SPORT0 switch with
       SPORT1. r0 switched with r1. This way the reg names in the rest of signal chain stays the same.

       The electrode to channel configurations between the two boards are not the same. So sorted templates
       are not interchangeable.
    */
    
    r2.h = 0xFFFF;
    r2.l = 0x0000;
    r1 = [p0 + (SPORT1_RX - SPORT0_RX)];   // SPORT1-primary: Ch32-63
    r0 = [p0 + (SPORT1_RX - SPORT0_RX)];   // SPORT1-sec:     Ch0-31

    r1 <<= 15;              
    r0 >>= SHIFT_BITS;
    r1 = r1 & r2;           
    r2 = r0 + r1;                          // r2 = Ch32, Ch0 (lo, hi). 16-bits samples

    // load in new convert command
    r7 = NEXT_CHANNEL_SHIFTED; 
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 primary TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 sec TX
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 primary TX
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 sec TX

    r5 = [i0++];    // r5.l=0x7fff, r5.h=0x8000. i0 @2nd inte coefs after.
.align 8
    // integrator stage - the incoming samples are alreayd in Q1.15 format.

    [i2++] = r2 || r0 = [i1++]; // save new sample. i1,i2 @ integrator mean after
    a0 = r2.l * r5.l, a1 = r2.h * r5.l || r1 = [i1++];  // a0=(Q31)sample. r1=integrated mean. i1@AGCgain

    // r0=how much sample deviates from integrated mean. r6.l=0x7fff, r6.h=0x0640
    r0.l = (a0 += r1.l * r5.h), r0.h = (a1 += r1.h * r5.h) || r6=[i0++]; // i0@AGC_target after
    
    a0 = r1.l * r6.l, a1 = r1.h * r6.l; // a0=mean in Q31

    // r2=updated mean. r5=AGC-gain, r7=AGC-target. i1@final-sample, i0@AGC-scaler/enable. 
    r2.l = (a0 += r0.l * r6.h), r2.h = (a1 += r0.h * r6.h) || r5=[i1++] || r7=[i0++];

    // AGC-stage

    a0 = r0.l * r5.l, a1 = r0.h * r5.h || [i2++] = r2; //a0,a1=AGCgain*devFromMean. Save new mean. i2@AGCgain
    
    /* Result in accumulator is Q1.31. Multiplication treated as (Q1.31)*(Q7.8). Q7.8 has
       8 bits before the decimal point. The result should have 9 bits before the decimal point.
       Therefore, we need to left shift the accumulator 8 more bits to position the actual decimal
       point at accumulator's decimal point position.

       This is because when we move the accumulator result to half dreg, we only take the highest
       16-bits (A0.H, A1.H) in default mode (treat as signed fraction).
   */
    a0 = a0 << 8;   
    a1 = a1 << 8;
    r0.l = a0, r0.h = a1;     // Move half reg, treat result as signe frac. Round to bit 16 and extract.
    a0 = abs a0, a1 = abs a1; // Need to compare abs-scaled deviation to target.
    
    // Signed-int mode for MAC. Result should be 0x7fff or 0x8000, tell us if target is smaller or not.
    // r6.l = 16384 (0.5), r6.h = 1 (AGC-enable). i0@LPF1 b0
    r4.l = (a0 -= r7.l * r7.l), r4.h = (a1 -= r7.h * r7.h) (is) || r6 = [i0++];

    /* Update AGC-gain (trick math here):
       r5 = AGC-gain, which is in Q8.8 format. r6.l=0x4000=0.5 in Q1.15 format.
       Turns out if we do 
            a0=r5.l*r6.l, r3.l=(a0-=0*0) (s2rnd)
       Then the result in r3.l is the same value in Q8.8 format.

       In the second line below, r4.l/h is either 0x7fff or 0x8000. So it acts as 
       either subtracting 2^-8 from the original Q8.8 gain's value; Or as adding
       2^-7 to the original Q8.8 gain's value after extraction.
   */
    a0 = r5.l * r6.l, a1 = r5.h * r6.l;     // load a0 with scaled AGC-gain
    r3.l = (a0 -= r4.l * r6.h), r3.h = (a1 -= r4.h * r6.h) (s2rnd); // within certain range gain doesnt change
    r3 = abs r3 (v);
    [i2++] = r3 || r2 = [i1++];    // Save AGC-gain, i2@final sample. i1@ x0(n-1)
    [i2++] = r0;                   // Save final sample, i2@ x0(n-1)

.align 8
    /* Start 2 back-to-back direct-form 1 biquads. At this point,
        r0 = final AGC sample
        i0 @ LPF1 b0
        i1 @ x0(n-1) of current channel.
        i2 @ x0(n-1) of current channel.

       If i1 and i2 are dereferenced (read out) in the same cycle, the processor will stall -- each of the
       1k SRAM memory banks has only one port.
   */
   r5 = [i0++] || r1 = [i1++];  // r5=b0(LPF), r1=x0(n-1); i0@b1(LPF), i1@x0(n-2)
   a0 = r0.l * r5.l, a1 = r0.h * r5.h || r6 = [i0++] || r2 = [i1++];    // r6=b1(LPF), r2=x0(n-2)
   a0 += r1.l * r6.l, a1 += r1.h * r6.h || r7 = [i0++] || r3 = [i1++];  // r7=a0(LPF), r3=y1(n-1)
   a0 += r2.l * r5.l, a1 += r2.h * r5.h || r5 = [i0++] || r4 = [i1++];  // r5=a1(LPF), r4=y1(n-2)
   a0 += r3.l * r7.l, a1 += r3.h * r7.h || [i2++] = r0;                 // update x0(n-1), i2@x0(n-2)
   r0.l = (a0 += r4.l * r5.l), r0.h = (a1 += r4.h * r5.h) (s2rnd) || [i2++] = r1; // r0=y1(n), update x0(n-2)

   // now i0@b0(HPF1), i1@y2(n-1). i2@y1(n-1)
   r5 = [i0++] || [i2++] = r0;  // r5=b0(HPF1), update y1(n-1); i0@b1(HPF1), i2@y1(n-2)
   a0 = r0.l * r5.l, a1 = r0.h * r5.h || r6 = [i0++] || [i2++] = r3;    // r6=b1(HPF1). update y1(n-2)
   a0 += r3.l * r6.l, a1 += r3.h * r6.h || r7 = [i0++] || r1 = [i1++];  // r7=a0(HPF1). r1=y2(n-1)
   a0 += r4.l * r5.l, a1 += r4.h * r5.h || r2 = [i1++];                 // r2=y2(n-2)
   a0 += r1.l * r7.l, a1 += r1.h * r7.h || r5 = [i0++];                 // r5=a1(HPF1)
   r0.l = (a0 += r2.l * r5.l), r0.h = (a1 += r2.h * r5.h) (s2rnd);      // r0=y2(n)

   // now i0@next ch integ1; i1@next sample; i2@y2(n-1)
   [i2++] = r0; // save current y2(n) in y2(n-1)'s spot. i2 @ y2(n-2)
   [i2++] = r1; // save current y2(n-1) in y2(n-2)'s spot. i2 @ next sample

   w[p2++] = r0; // save amp1's oscillator results (r0.l)

   // all pointers are ready for next two channels of this group.
   // i0 @ next ch integ1; i1,i2 @ next sample.

//---------------------------------------------------------------------------------------
    r2.h = 0XFFFF;
    r2.l = 0x0000;

    // Process the other two channels in this group. Pretty much identical as before.
    r1 = [p0];      // SPORT0-primary: Ch96-127
    r0 = [p0];      // SPORT0-sec:     Ch64-95

    r1 <<= 15; 
    r0 >>= SHIFT_BITS;
    r1 = r1 & r2;
    r2 = r0 + r1;

    r5 = [i0++];
.align 8    
    // integrator stage
    [i2++] = r2 || r0 = [i1++]; // save new sample. i1,i2 @ integrator mean after.
    a0 = r2.l * r5.l, a1 = r2.h * r5.l || r1 = [i1++];  // a0=(Q15)sample. r1=integrated mean. i1@AGCgain
    
    // r0=how much sample deviates from mean. r6.l=0x7fff, r6.h=0x0640
    r0.l = (a0 += r1.l * r5.h), r0.h = (a1 += r1.h * r5.h) || r6=[i0++]; // i0@AGCTargert after

    a0 = r1.l * r6.l, a1 = r1.h * r6.l; // a0=mean

    // r2=updated mean. r5=AGCgain, r7=AGCTarget. i1@final-sample, i0@AGC-scaler/enable.
    r2.l = (a0 += r0.l * r6.h), r2.h = (a1 += r0.h * r6.h) || r5=[i1++] || r7=[i0++];

    // AGC-stage
    a0 = r0.l * r5.l, a1 = r0.h * r5.h || [i2++] = r2; //a0,a1=AGCgain*devFromMean. Save new mean. i2@AGCgain
    a0 = a0 << 8;
    a1 = a1 << 8;
    r0.l = a0, r0.h = a1;     // Move half reg, treat result as signed frac. Round to bit 16 and extract.
    a0 = abs a0, a1 = abs a1; // Compare abs-scaled deviation to target.

    // signed-int mode MAC. Result should be 0x7fff or 0x8000 - tells if target is smaller or not.
    // r6.l = 0x4000, r6.h=1 (AGC-enable). i0@integ_coef1
    r4.l = (a0 -= r7.l * r7.l), r4.h = (a1 -= r7.h * r7.h) (is) || r6 = [i0++];

    // update AGCgain
    a0 = r5.l * r6.l, a1 = r5.h * r6.l; // convert AGCgain to Q1.15
    r3.l = (a0 -= r4.l * r6.h), r3.h = (a1 -= r4.h * r6.h) (s2rnd);
    r3 = abs r3 (v);
    [i2++] = r3 || r2 = [i1++]; // Save AGCgain. i2@final sample. i1@next sample
    [i2++] = r0;                // Save final sample, i2@x0(n-1)

.align 8
    /* Start 2 back-to-back direct-form 1 biquads. At this point,
        r0 = final AGC sample
        i0 @ LPF1 b0
        i1 @ x0(n-1) of current channel.
        i2 @ x0(n-1) of current channel.

       If i1 and i2 are dereferenced (read out) in the same cycle, the processor will stall -- each of the
       1k SRAM memory banks has only one port.
   */
   r5 = [i0++] || r1 = [i1++];  // r5=b0(LPF), r1=x0(n-1); i0@b1(LPF), i1@x0(n-2)
   a0 = r0.l * r5.l, a1 = r0.h * r5.h || r6 = [i0++] || r2 = [i1++];    // r6=b1(LPF), r2=x0(n-2)
   a0 += r1.l * r6.l, a1 += r1.h * r6.h || r7 = [i0++] || r3 = [i1++];  // r7=a0(LPF), r3=y1(n-1)
   a0 += r2.l * r5.l, a1 += r2.h * r5.h || r5 = [i0++] || r4 = [i1++];  // r5=a1(LPF), r4=y1(n-2)
   a0 += r3.l * r7.l, a1 += r3.h * r7.h || [i2++] = r0;                 // update x0(n-1), i2@x0(n-2)
   r0.l = (a0 += r4.l * r5.l), r0.h = (a1 += r4.h * r5.h) (s2rnd) || [i2++] = r1; // r0=y1(n), update x0(n-2)

   // now i0@b0(HPF1), i1@y2(n-1). i2@y1(n-1)
   r5 = [i0++] || [i2++] = r0;  // r5=b0(HPF1), update y1(n-1); i0@b1(HPF1), i2@y1(n-2)
   a0 = r0.l * r5.l, a1 = r0.h * r5.h || r6 = [i0++] || [i2++] = r3;    // r6=b1(HPF1). update y1(n-2)
   a0 += r3.l * r6.l, a1 += r3.h * r6.h || r7 = [i0++] || r1 = [i1++];  // r7=a0(HPF1). r1=y2(n-1)
   a0 += r4.l * r5.l, a1 += r4.h * r5.h || r2 = [i1++];                 // r2=y2(n-2)
   a0 += r1.l * r7.l, a1 += r1.h * r7.h || r5 = [i0++];                 // r5=a1(HPF1)
   r0.l = (a0 += r2.l * r5.l), r0.h = (a1 += r2.h * r5.h) (s2rnd);      // r0=y2(n)

   // now i0@next ch integ1; i1@next sample; i2@y2(n-1)
   [i2++] = r0; // save current y2(n) in y2(n-1)'s spot. i2 @ y2(n-2)
   [i2++] = r1; // save current y2(n-1) in y2(n-2)'s spot. i2 @ next sample.
rts;
    
.global _radio_bidi_asm // start of firmware execution
_radio_bidi_asm:
    // set SPI baudrate
    p5.l = LO(SPI_BAUD);
    p5.h = HI(SPI_BAUD);
    r0 = 4 (z);     // For a core clock of 80MHz, run it at 10MHz.
                    // Nordic has 8Mhz as highest SCK frequency, but 10MHz has been working for Tim.
    w[p5] = r0;     // must be 16-bits-word-sized-write

//------------------- Initialize variable and state pointers ---------------------
    // FP : points to FP_BASE
    fp.l = LO(FP_BASE);
    fp.h = HI(FP_BASE);
    
    // P0: free, though usually points to Serial port RX data register
    p0.l = LO(SPORT0_RX);
    p0.h = HI(SPORT0_RX);
    [FP - FP_SPORT0_RX] = p0;

    // P1: portF - FIO_FLAG_D (can be used for other stuff too)
    p1.l = LO(FIO_FLAG_D);
    p1.h = HI(FIO_FLAG_D);
    [FP - FP_FIO_FLAG_D] = p1;

    // P2: pointer for READING through MEMBUFF for JTAG reading. 
    p2.l = LO(MEMBUFF);
    p2.h = HI(MEMBUFF);

    // P3: SPI TDBR - writting SPI commands/data to radio
    p3.l = LO(SPI_TDBR);
    p3.h = HI(SPI_TDBR);
    [FP - FP_SPI_TDBR] = p3;

    // P4: point for WRITING to MEMBUFF for saving samples for JTAG reading
    p4.l = LO(MEMBUFF);
    p4.h = HI(MEMBUFF);
    
    // FP_CHAN: points to the CURRENT channel we are working on - pre-incremented.
    r0 = 30(z); // need to account for the pipeline stuff...
    [FP - FP_CHAN] = r0;
    
    /* FP_QS: points to how many samples we have currently written to a packet -- 6 samples
     *        per transmitted channel, per packet.
     */
    r0 = 0;
    [FP- FP_QS] = r0;
    
    // FP_QPACKETS: points to number of queued packets -- 16 packets in a frame before transmitting to radio
    [FP - FP_QPACKETS] = r0;

    // FP_8080, FP_5555, FP_aaaa holds (name-sake) masks to be used.
    r0.l = 0x8080;
    r0.h = 0x8080;
    [FP - FP_8080] = r0;    // used to convert signed binary to unsigned offset binary.
    r0.l = 0x5555;
    r0.h = 0x5555;
    [FP - FP_5555] = r0;    // doesn't seem to be used...
    r0.l = 0xaaaa;
    r0.h = 0xaaaa;
    [FP - FP_AAAA] = r0;    // doesn't seem to be used...

    // LMS gain and weight decay
    r0.l = 0x0003;  // lower word=3
    r0.h = 0x7fff;  // higher word=0x7fff = (Q15)0.9999. LMS weight decay.
    [FP - FP_WEIGHTDECAY] = r0;

    // Template match buffer. Each byte holds template matches in the form:
    // [ch 64B][ch 0B][ch 64A][ch 0A][ch 96B][ch 32B][ch 96A][ch 32A] (from low to high addr)
    r0.l = LO(MATCH);
    r0.h = HI(MATCH);
    [FP - FP_MATCH_BASE] = r0;  // FP_MATCH_BASE points to start of template-match buffer.
    r0.l = LO(MATCH + 32);
    r0.h = LO(MATCH + 32);
    [FP - FP_MATCH_PTR7] = r0;  // FP_MATCH_PTR7 points to the 7b-encoded version of temp-matches.

    // LED blinker state
    r0 = 0;
    [FP - FP_BLINK] = r0;

    // template encoding and state (echo bits) look up table
    r0.l = LO(ENC_LUT);
    r0.h = HI(ENC_LUT);
    [FP - FP_ENC_LUT_BASE] = r0;    // addressed byte-wise; no align needed.
    r0.l = LO(STATE_LUT);
    r0.h = HI(STATE_LUT);
    r0 = r0 >> 2;                   // because we use add with shift for 4-byte word alignment.
    [FP - FP_STATE_LUT_BASE] = r0;  // this makes future binary math easy (see later echo-flag extraction)

    /* Setup default pointers of values to transmit.
       Memory layout is little-endian.
       Note that only 8-bits of the selected sample can be transmitted in a radio-sample. Thus
       the pointer should point to the higher byte of 16-bits word holding that sample.

        To select values for [channel 1, 33, 65, 97], for example, use W1+W1_STRIDE*2*4*1 instead of W1 to 
        address values in W1 (each group of 4 channels occupy 2 32-bit words), where 1~[0,31] is the which
        4-channel group we want.
    */
    // channel 0 
    r0.l = LO(W1 + 1);   // ch0 amp or integrator output 
    r0.h = HI(W1 + 1);
    [FP - FP_TXCHAN0] = r0;
    // channel 31
    r0.l = LO(W1 + W1_STRIDE*2*4*31 + 1);   
    r0.h = HI(W1 + W1_STRIDE*2*4*31 + 1);
    [FP - FP_TXCHAN1] = r0;
    // channel 32
    r0.l = LO(W1 + 2 + 1)    
    r0.h = HI(W1 + 2 + 1);
    [FP - FP_TXCHAN2] = r0;
    // channel 63
    r0.l = LO(W1 + W1_STRIDE*2*4*31 + 2 + 1);   
    r0.h = HI(W1 + W1_STRIDE*2*4*31 + 2 + 1);
    [FP - FP_TXCHAN3] = r0;

    /* PF pin setup:
       Make sure we aren't driving anything we need not be.
       - SPI_CE = PF0  -- initially high to deselect - Output - radio
       - SPI_CSN = PF1 -- initially high to deselect - Output - radio
       - LED_BLINK = PF4 -- initially high to light LED - Output

       - SPI_CS = PF2  -- flash memory - input
       - SPI_IRQ = PF3 -- radio IRQ    - input

       FIO_DIR = 0b 0000 0000 0001 0011  (1 = output, 0 = input)
    */
    r0 = SPI_CE | SPI_CSN | LED_BLINK;
    w[p1 + (FIO_DIR - FIO_FLAG_D)] = r0;

    // Enable input buffer for only radio's _IRQ pin
    r0 = SPI_IRQ;
    w[p1 + (FIO_INEN - FIO_FLAG_D)] = r0;
    
    ssync;

    //--------------------- Signal chain coefficients -----------------
    // A1 is the coefficient circuluar buffer. i0 is the writing pointer
    i0.l = LO(A1);
    i0.h = HI(A1);
    l0 = A1_STRIDE*32*4;    // A1_STRIDE: number of 32-bit words * 4 bytes/word * 32 four-channel groups
    b0 = i0;

    // i1 is for reading the W1 circular buffer -- contains the value of the samples
    i1.l = LO(W1);
    i1.h = HI(W1);
    l1 = W1_STRIDE*2*32*4;  // 2 32-bit words/group, 32 group total. This is number of bytes
    b1 = i1;

    // i2 is for writing delays in the W1 circular buffer. i2 usually lags i1 (i.e. update values).
    i2 = i1;
    l2 = l1;
    b2 = b1;

    /* Next, we go through circular buffer A1, and set up the coefficients needed for the 
       signal chain. 

       Each group of 4 channels require 4 32-bit words for AGC.
       (see memory_AGC.h and radio_AGC_memoryMap.ods).
       
       The memory structure of A1 is then made up of 32 A1_strides(also see memory_map spreadsheet), 
       each A1 stride contains the following:

       AGC ceofs

       There are a total of 32 groups of 4-channels. Each each loop of lt_top, we populate 1 A1-stride.
       Each lt2_top loop populates the 2 of the 4-channels in a particular group.

       Our counter will be at 63, this makes our pointers start at the first block, corresponding to
       starting sample acquisition at ch[31,63,95,127]
   */
    p5 = 32+31 (x);
    lsetup(lt_top, lt_bot) lc0 = p5;    // each loop of lt_top is one A1_stride
lt_top:
    p5 = 2;
    lsetup(lt2_top, lt2_bot) lc1 = p5;  // each lt2_top is one set of coefs
lt2_top:
    // gain and integrator
    
    // Assuming input samples are 12-bits unsigned.
    /*
    r0.l = 32767;   w[i0++] = r0.l;
    r0.l = -16384;  w[i0++] = r0.l;
    r0.l = 16384;   w[i0++] = r0.l;
    r0.l = 800;     w[i0++] = r0.l;
    */

    // Assuming input samples are 16-bits signed
    r0.l = 0x7fff;  w[i0++] = r0.l;
    r0.l = 0x8000;  w[i0++] = r0.l;
    r0.l = 0x7fff;  w[i0++] = r0.l;
    r0.l = 1600;    w[i0++] = r0.l;

    /* AGC: 
        Target is 6000*16384, which in Q15 is ~0.09155. We store just the target's square
        root (in Q15). This is so we can later accomodate big target values (32 bits).
    */
    r0.l = 9915;    w[i0++] = r0.l;     // AGC target sqrt = sqrt(6000*16384), Q15.
    r0.l = 9915;    w[i0++] = r0.l;     // AGC target sqrt = sqrt(6000*16384), Q15.
    r0.l = 16384;   w[i0++] = r0.l;     // Q15, =0.5
    r0.l = 1;       w[i0++] = r0.l;     // Set this to zero to disable AGC. Q7.8

    /* IIR filter, biquad implementation. */
    // LPF1: induce ~900Hz oscillation, wont be filtered by next biquad. 
    r0 = 0 (x); w[i0++] = r0.l; w[i0++] = r0.l;  // b0
    r0 = 0 (x); w[i0++] = r0.l; w[i0++] = r0.l;  // b1
    r0 = 32195(x); w[i0++] = r0.l; w[i0++] = r0.l;  // a0
    r0 = -16384(x); w[i0++] = r0.l; w[i0++] = r0.l;  // a1

    // HPF1: 500Hz cutoff
	r0 = 15260 (x);	w[i0++] = r0.l; w[i0++] = r0.l; // b0
	r0 = -30519(x);w[i0++] = r0.l; w[i0++] = r0.l; // b1
	r0 = 30442 (x);	w[i0++] = r0.l; w[i0++] = r0.l; // a0
	r0 = -14213(x);w[i0++] = r0.l; w[i0++] = r0.l; // a1
lt2_bot: nop;

lt_bot: nop;

    p5 = (32+31)*2;

    // r0 holds initial values for original and final samples
    r0.l = 0x0000;  // ch0-31, ch64-95
    r0.h = 0x0000;  // ch32-63, ch96-127

    // let y(n-1)=y(n-2)=0.5, in base 14
    r2.l = 8192;
    r2.h = 8192;

    lsetup(zer_top, zer_bot) lc0 = p5;
zer_top:
    // Write W1 values manually, 1 W1_STRIDE (10 values) at a time, according to memory_AGC_IIR
    [i1++] = r0; r1 = [i2++]; // initial sample values
    [i1++] = r0; r1 = [i2++]; // integrator mean
    [i1++] = r0; r1 = [i2++]; // AGC gain
    [i1++] = r0; r1 = [i2++]; // AGC-out
    [i1++] = r0; r1 = [i2++]; // x0(n-1)
    [i1++] = r0; r1 = [i2++]; // x0(n-2)

    [i1++] = r2; r1 = [i2++]; // y1(n-1)
    [i1++] = r2; r1 = [i2++]; // y1(n-2)

    [i1++] = r0; r1 = [i2++]; // y2(n-1)
    [i1++] = r0; r1 = [i2++]; // y2(n-2)
zer_bot: nop;

    /* Setup the MATCH buffer.
       The MATCH buffer contains 8 32-bit words. It will be populated one byte a time. Each byte
       corresponds to the template match results for one group of four channels (2 template match
       bits per channel).
        
       The last byte in this buffer, for example, contains the match bits for:
       channels[127B, 63B, 127A, 63A, 95B, 31B, 95A, 31A]
    */
    p5.l = LO(MATCH);
    p5.h = HI(MATCH);
    r0 = 0;
    [p5++] = r0;    // word 1
    [p5++] = r0;    // word 2
    [p5++] = r0;    // word 3
    [p5++] = r0;    // word 4
    [p5++] = r0;    // word 5
    [p5++] = r0;    // word 6
    [p5++] = r0;    // word 7
    [p5++] = r0;    // word 8

    /* Set up the template-match look-up table values.
       ENC_LUT contains mapping between 8bits template-matches to 7 bits.
       ENC_STATE_LUT contains bits for getting the echo.
    */
    call _enc_create;

    // enable the watchdog timer.
    p5.l = LO(WDOG_CNT);
    p5.h = HI(WDOG_CNT);
    r0.h = 0x000c;  // set the timer for 10ms = 8e5 clks (80MHz SCLK),
    r0.l = 0x3500;  // will be reset after sending an entire frame of 16 packets,
    [p5--] = r0;    // by writing anything to WDOG_STAT.
    r0 = 0x0;       // generate reset event, enable watchdog.
    w[p5] = r0;
    ssync;

comm_setup:
    /* Setup up the communication between SPORT ports and Intan.
       
       Will send the configuration settings to all Intan chips, the
       response include, in 16-bit words:
       
         2 for emptying pipeline
         1 for repeat command 1
         18 for each write register command
         10 for (calibration + 9 dummy commands)
         5  for each READ intan commands
       
       This results in 36 16-bit words per chip -> 18 32-bit words per amplifier 
       -> 18*4 = 72 32-bit words total --> round this to 80 words for storage.

       These words will be stored in space >= FP_BASE
    */
    p1.l = LO(FP_BASE); // Need to restore p1 to FIO_FLAG_D later
    p1.h = HI(FP_BASE);
    r0 = 0 (z);
    p5 = 80;
    lsetup(storage_top, storage_bot) lc0 = p5;
    storage_top:
        [p1++] = r0;
    storage_bot: nop;

    p1.l = LO(FP_BASE);
    p1.h = HI(FP_BASE);
   
intan_setup:
    /* First load a command in first before turning on SPORT
       to prevent leftover in the TX_buffer from screwing things up
       in the pipeline.
    */
    r0 = REG0(z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;

sport_configs:
    p5.l = LO(SPORT0_TCR1); // SPORT0-TCR1
    p5.h = HI(SPORT0_TCR1);
    r0.l = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK | TSPEN | DITFS;
    w[p5] = r0;

    p5.l = LO(SPORT1_TCR1);
    p5.h = HI(SPORT1_TCR1);
    w[p5] = r0;

    p5.l = LO(SPORT0_RCR1); // SPORT0-RCR1
    p5.h = HI(SPORT0_RCR1);
    r0.l = RCKFE | LARFS | LRFS | RFSR | RSPEN;
    w[p5] = r0;

    p5.l = LO(SPORT1_RCR1);
    p5.h = HI(SPORT1_RCR1);
    w[p5] = r0;
    ssync;

    // Ready to setup Intan registers. First repeat the first command in case
    // of pipeline troubles...
    r0 = REG0 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                      // call 1
    
    r0 = REG1 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                      // call 2
    
    r0 = REG2 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                      // call 3
    
    r0 = REG3 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                     // call 4
    
    //r0 = REG4 (z);
    r0 = REG4_DSP_SIGNED (z);  // this with DSP filter enabled, signed samples
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                     // call 5

    r0 = REG5 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 6

    r0 = REG6 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 7

    r0 = REG7 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 8
    
    r0 = REG8 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 9
    
    r0 = REG9 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 10
    
    r0 = REG10 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 11

    r0 = REG11 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 12

    r0 = REG12 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 13
    
    r0 = REG13 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 14
    
    r0 = REG14 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 15
    
    r0 = REG15 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 16
    
    r0 = REG16 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 17

    r0 = REG17 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 18

adc_calibration:    
    // send CALIB, then 9 dummy commands. Expect 10 words back
    r0 = CALIB (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 19

    r0 = READ_42 (z);
    r0 = r0 << SHIFT_BITS;  // dummy1
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 20

    // dummy2
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 21

    // dummy3
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 22

    // dummy4
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 23

    // dummy 5
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 24

    // dummy 6
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 25

    // dummy 7
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 26

    // dummy 8
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 27

    // dummy 9
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 28    

spell_intan:
    r0 = READ_40 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 29

    r0 = READ_41 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 30
    
    r0 = READ_42 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 31

    r0 = READ_43 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                    // call 32
    
    r0 = READ_44 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                   // call 33

    // Setup the pipeline for data acquisition..
    // r4 keeps track of the current channel, r0 is the command
    r4 = 0;
    r0 = r4 << 8;
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                  // call 34 

    r4 += 1;
    r0 = r4 << 8;
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                  // call 35

    r4 += 1;
    r0 = r4 << 8;
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    //call wait_samples; // call 36, now all setup stuff is out of pipeline and saved.
                         // next one will be the result of CONVERT0
                         // FP_CHAN should be set to 30 initially.

    p1.l = LO(FIO_FLAG_D);
    p1.h = HI(FIO_FLAG_D);

    jump radio_loop;

wait_samples:
    /* Used during Intan setup. Wait for word in MOSI then save them
       to buffer starting (and increase from) FP_BASE, addressed in
       p1.
    */
    r1 = w[p0 + (SPORT1_STAT - SPORT0_RX)];
    cc = bittst(r1, 0);
    if !cc jump wait_samples;
    
    // save new samples, in order from amp1 to amp4
    r2 = [p0 + (SPORT1_RX - SPORT0_RX)];    // SPORT1 pri - 2nd amp
    r3 = [p0 + (SPORT1_RX - SPORT0_RX)];    // SPORT1 sec - 1st amp
    r2 >>= SHIFT_BITS;
    r3 >>= SHIFT_BITS;
    w[p1++] = r3;                           // 1st amp at lower word
    w[p1++] = r2;                           // 2nd amp at higher word

    r2 = [p0];                              // SPORT0 pri - 4th amp
    r3 = [p0];                              // SPORT0 sec - 3rd amp
    r2 >>= SHIFT_BITS;                      
    r3 >>= SHIFT_BITS;
    w[p1++] = r3;                           // 3rd amp at lower word
    w[p1++] = r2;                           // 4th amp at higher word
    rts;

radio_loop: // main thread, interleaved with _get_asm to process samples
    p5 = TOTAL_CALL_ASM;
    lsetup(push_top, push_bot) lc0 = p5;
push_top:
    call _get_asm;
push_bot: nop;

we_finished:
    jump we_finished;

