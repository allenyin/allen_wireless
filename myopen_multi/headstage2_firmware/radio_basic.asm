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

#define REG4              0x8480 // get back 0xff80
#define REG4_DSP_UNSIGNED 0x8484 // get back 0xff94
#define REG4_DSP_SIGNED   0x84D4 // get back 0xffD4
#define REG4_SIGNED       0x84C4 // get back 0xffC4

#define REG5  0x8500    // get back 0xff00
#define REG6  0x8600    // get back 0xff00
#define REG7  0x8700    // get back 0xff00

// Intan REG8-13, configured for [150Hz, 7.5kHz]
//#define REG8  0x8816    // get back 0xff16
//#define REG9  0x8900    // get back 0xff00
//#define REG10 0x8a17    // get back 0xff17
//#define REG11 0x8b00    // get back 0xff00
//#define REG12 0x8c15    // get back 0xff15
//#define REG13 0x8d00    // get back 0xff00

// Intan REG8-13, configured for [250Hz, 10kHz]
#define REG8  0x8811    // get back 0xff11. 
#define REG9  0x8900    // get back 0xff00
#define REG10 0x8a10    // get back 0xff10. 
#define REG11 0x8b00    // get back 0xff00
#define REG12 0x8c11    // get back 0xff11. 
#define REG13 0x8d00    // get back 0xff00

#define REG14 0x8eff    // get back 0xffff
#define REG15 0x8fff    // get back 0xffff
#define REG16 0x90ff    // get back 0xffff
#define REG17 0x91ff    // get back 0xffff
#define CALIB 0x5500    // get back 0x8000

#define CONVERT0 0x0000
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
    r3 = w[p0 + (SPORT0_STAT - SPORT0_RX)];
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

/* This next block can be uncommented to generate a ramp, to check for radio corruption.
    r2.l = 8;
    r2.h = 8;
    r1 = [i1++];
    r2 = r1 + r2;
    [i2++] = r2;   // save sample, should be ramp.
*/
   
/* Actual acquisition code */
    r1 <<= 15;
    r0 >>= SHIFT_BITS;
    r1 = r1 & r2;
    r2 = r0 + r1;         // r2 = Ch32, Ch0 (lo, hi). 16-bits samples
    r2 = r2 << 3 (v,s);   // multiply signal by 8
    [i1++] = r2;    // save new sample

    // load in new convert command
/*
    r7 = NEXT_CHANNEL_SHIFTED;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 primary TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 sec TX
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 primary TX
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 sec TX
*/


nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;

nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;

//---------------------------------------------------------------------------------------
    r2.h = 0XFFFF;
    r2.l = 0x0000;

    // Process the other two channels in this group. Pretty much identical as before.
    r1 = [p0];      // SPORT0-primary: Ch96-127
    r0 = [p0];      // SPORT0-sec:     Ch64-95

/* Code to generate a ramp.
    r2.l = 8;
    r2.h = 8;
    r1 = [i1++];
    r2 = r1 + r2;
    [i2++] = r2;
*/

    r1 <<= 15;
    r0 >>= SHIFT_BITS;
    r1 = r1 & r2;
    r2 = r0 + r1;
    r2 = r2 << 3 (v,s);
    [i1++] = r2;    // save new sample
    
/* Just give the last two amps 0 values for test.
    r2.h = 0x0000;
    r2.l = 0x0000;
    [i1++] = r2;
*/


nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;

nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;

//----------------------------------------------------------------------------------------  
    r0 = 0; // not doing template match, so this is the dummy match

    p0 = [FP - FP_CHAN];
    p1 = [FP- FP_ENC_LUT_BASE];
    p5 = [FP - FP_MATCH_BASE];
    r6 = p0;            // r6 = current group of channels
    p5 = p5+p0;
    r1 = b[p5];
    r1 = r1 | r0;
    p0 = r1;
    b[p5] = r1;

    // dummy update of 7bit encoding, 7bits byte added to radio packet
    p3 = 32;
    p5 = p5+p3;
    p1 = p1+p0;
    r2 = b[p1];
    b[p5] = r2;
    
    /*
        r4 = packet byte count (qs)
        r5 = number of queued packets, 0-15
        r6 = group number (0-31), [FP_CHAN]
    */
    r0 = 31; 
    cc = r6 == r0;
    if !cc jump end_txchan (bp);    // finish if not group31.
    
    // p0 and p5 are free; p1 and p3 are static and reset below.
    // p4 points to WFBUF - location in a pkt we are writing the new samples to

    // Below we write new samples to current packet.
    p0 = [FP - FP_TXCHAN0];
    p1 = [FP - FP_TXCHAN1];
    p3 = [FP - FP_TXCHAN2];
    p5 = [FP - FP_TXCHAN3];
    r0 = b[p0];
    r1 = b[p1];
    r2 = b[p3];
    r3 = b[p5];
    b[p4++] = r0;
    b[p4++] = r1;
    b[p4++] = r2;
    b[p4++] = r3;
    
    r4 = [FP - FP_QS];
    r7 = 6;
    r4 += 1;
    i3 += 4;
    cc = r4 == r7;
    // if we don't have 6 samples for each TXCHANx yet, then continue;
    // otherwise add the template matches and finish constructing the pkt
    
    if !cc jump end_txchan_qs (bp);
    r5 = [FP - FP_QPACKETS];
    p1 = r5;                        // used to index to state_lut; hide 4 cycle latency
    p0 = [FP - FP_STATE_LUT_BASE];
    p5 = [FP - FP_MATCH_PTR7];
    r5 += 1;                        // one more packet on the queue.
    [FP - FP_QPACKETS] = r5;        // write-back num-pkt
    p0 = (p0 + p1) << 2;            // 4 byte align
    r5 = [FP - FP_ECHO];            // echo flag in bits 31, 23, 15, 7.
    r7 = [p0];
    
    // p5 and and anyting related to FP_MATCH_PTR7 is set to 0, if edited it fucks with the 
    // echo bits in the template match bytes, and screws with the transmission.
    //r0 = 0;
    //r1 = 0;
// ----- This part is weird ---
    r0 = [p5++];
    r1 = [p5++];
// -----------------------------

    // flag upper bit in each byte with QS & echo
    r0 = r0 | r7;
    r1 = r1 | r5;

    // Reset the area just read in 7bit and 8bit MATCH memory
    r7 = p5;                   // r7 = Address in 7bit area right now
    p0 = -36;
    p5 = p5 + p0;              // p5 = corresponding address in 8bit (32+4 for post-inc)
    bitclr(r7,6);              // Reset r7 pointer
    bitset(r7,5);              // to keep it within 7b-encoding region
    [FP - FP_MATCH_PTR7] = r7; // and write it back
    
    // write template match to pkt
    [p4++] = r0;
    [p4++] = r1;
    r4 = 0;         // clear sample count in qs (also reset templat match in 8b region).

    // reset template match
    [p5--] = r4;
    [p5--] = r4;

end_txchan_qs:
    [FP - FP_QS] = r4;  // if we just finished a pkt, QS=0, otherwise it was incremented already.
    // make p4 loop in WFBUF region
    r7 = p4;            
    bitclr(r7, 10);     // two 512-byte frames. loop back after going through 1024 bytes.
    p4 = r7;
end_txchan:
    p1 = [FP - FP_FIO_FLAG_D];  // reset the pointers.
    p3 = [FP - FP_SPI_TDBR];
    rts;

_clearirq_asm: //just write the status register via spi to clear.
	[--sp] = rets;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	r6 = NOR_STATUS + 0x20; //write to status register
	w[p3] = r6;
	call _get_asm;
	r6 = 0x70;
	w[p3] = r6; //clear irq: set RX_DR to clear bit, set TX_DS to clear bit, set MAX_RT to clear bit 
	call _get_asm;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;
	rets = [sp++];
	rts;

_waitirq_asm:
	[--sp] = rets;
	r7 = 178; 
	[fp - FP_TIMER] = r7;
waitirq_loop:
	r6 = w[p1];
	cc = bittst(r6, 3); //irq pin.
	if !cc jump waitirq_end;
	call _get_asm;
	r6 = 0;
	r7 = [fp - FP_TIMER];
	cc = r6 == r7;
	if cc jump waitirq_end;
	r7 += -1;
	[fp - FP_TIMER] = r7;
	call _get_asm;
	jump waitirq_loop;
waitirq_end:
	call _get_asm;
	rets = [sp++];
	rts;

_clearfifos_asm:
    // p3 points to SPI_TBDR, restored from _get_asm
    // sending to nordic thru SPI follows clearing CSN, preceeds setting CSN
	[--sp] = rets;
	// flush RX fifo (seems to improve reliability)
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	r6 = NOR_FLUSH_RX;
	w[p3] = r6;     // option sent thru SPI when SPI_TBDR wrttien to.
	call _get_asm;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;
	// and flush TX fifo.
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	r6 = NOR_FLUSH_TX;
	w[p3] = r6;
	call _get_asm;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;
	// return.
	rets = [sp++];
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

    // P2: pointer for READING through WFBUF when transfering packet data for radio to transmit
    p2.l = LO(WFBUF);
    p2.h = HI(WFBUF);

    // P3: SPI TDBR - writting SPI commands/data to radio
    p3.l = LO(SPI_TDBR);
    p3.h = HI(SPI_TDBR);
    [FP - FP_SPI_TDBR] = p3;

    // P4: point for WRITING to WFBUF sampels and template matches when signal chain finishes.
    p4.l = LO(WFBUF);
    p4.h = HI(WFBUF);
    
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
    r0.h = HI(MATCH + 32);
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
    m0 = -7*4;              // for moving back to start of LMS weights in each group.
    b0 = i0;

    // i1 is for reading the W1 circular buffer -- contains the value of the samples
    i1.l = LO(W1);
    i1.h = HI(W1);
    l1 = W1_STRIDE*2*32*4;  // 2 32-bit words/group, 32 group total. This is number of bytes
    m1 = -7*W1_STRIDE*2*4;  // For moving back 7 channels -- used for LMS weight update.
    b1 = i1;

    // i2 is for writing delays in the W1 circular buffer. i2 usually lags i1 (i.e. update values).
    i2 = i1;
    l2 = l1;
    m2 = W1_STRIDE*2*4;     // for moving forward one group of channel's delay in LMS.
    b2 = b1;

    /* i3 is for reading/writing template delays (post-filter). In circular buffer T1.
       contains the delayed past 16 filterd samples, used to convolve with template values.
    */
    i3.l = LO(T1);
    i3.h = HI(T1);
    l3 = T1_LENGTH;
    m3 = 4*2;   // 2 32-bit words -- used to jump to the read point for LMS, has nothing to do with templs.
    b3 = i3;

    /* Next, we go through circular buffer A1, and set up pthe coefficients and templates needed for the 
       signal chain and spike-matching. The number of 32-bit words required for coefficients is, as in
       memory.h: (A1_AGC + A1_LMS + A1_IIR)*2 = 27*2 = 54.  
       these include: LPF-integrator, AGC, LMS-weights, IIR-filter coefficients.

       For templates, we require: (A1_template + A1_aperture)*2 = 36. 

       For each group of 4-channels, we need two groups of coefficients (hence the 2x multiplier in
       calculating space needed for coefficeints above) in memory. Two channels are
       processed at a time. Each coefficient is 16-bit. So in 27 32-bits words, we can hold the coefs 
       needed to process two channels. 

       For spike-sorting, each channel can match to two templates. Each template has an associated
       aperture. When template-matching, we compare the past 16 filtered samples (stored in T1, indexed
       with i3) with the corresponding template time-step values (effectively convolution between 16 sample
       values with 16 template values, in time). The accumulated differences are then compared to
       the corresponding aperture value, a match results if the difference is less than aperture.          
       
       The memory structure of A1 is then made up of 32 A1_strides(also see memory_map spreadsheet), 
       each A1 stride contains the following:

       Aperture B  (2 32-bit words)         <--- high address
       Templates B (16 32-bit words)
       Aperture A  (2 32-bit words)
       Templates A (16 32-bit words)
       IIR coefs   (16 32-bit words) --- 
       LMS coefs   (7 32-bit words)    | coefs set one
       AGC coefs   (2 32-bit words)    |
       Integ coefs (2 32-bit words)  ---
       IIR coefs   (16 32-bit words) ---
       LMS coefs   (7 32-bit words)    | coefs set two
       AGC coefs   (2 32-bit words)    |
       Integ coefs (2 32-bit words)  ---    <--- low address

       There are a total of 32 groups of 4-channels. Each each loop of lt_top, we populate 1 A1-stride.
       Our counter will be at 63, this makes our pointers start at the first block, corresponding to
       starting sample acquisition at ch[31,63,95,127]
   */
    p5 = 32+31 (x);
    lsetup(lt_top, lt_bot) lc0 = p5;    // each loop of lt_top is one A1_stride
lt_top:
    p5 = 2;
    lsetup(lt2_top, lt2_bot) lc1 = p5;  // each lt2_top is one set of coefs
lt2_top:
    /* Gain and integrator coefs for first stage:
       All coefficients here are in Q15 format. 16-bits, hence w[i0++] increment (16-bit word increment)
    */
    r0.l = 32000;   w[i0++] = r0.l; // 32000 = (Q15) 0.9765 -- pre-gain
    r0.l = -16384;  w[i0++] = r0.l; // -16384 = (Q15) 0.5
    r0.l = 16384;   w[i0++] = r0.l; // 16384 = (Q15) 0.5
    r0.l = 800;   w[i0++] = r0.l;   // mu = 0.0244
    
    /* AGC: 
        Target is 6000*16384, which in Q15 is ~0.09155. We store just the target's square
        root (in Q15). This is so we can later accomodate big target values.
    */
    r0.l = 9915;    w[i0++] = r0.l;     // AGC target sqrt = sqrt(6000*16384), Q15.
    r0.l = 9915;    w[i0++] = r0.l;     // AGC target sqrt = sqrt(6000*16384), Q15.
    r0.l = 16384;   w[i0++] = r0.l;     // Q15, =0.5
    r0.l = 1;       w[i0++] = r0.l;     // Set this to zero to disable AGC. Q7.8

    // LMS coefs - 7 total.
    r0 = 0 (x);
    [i0++] = r0;
    [i0++] = r0;
    [i0++] = r0;
    [i0++] = r0;
    [i0++] = r0;
    [i0++] = r0;
    [i0++] = r0;

    /* Butterworth (minimum ripple) filters - implemented as 4 back-to-back Direct Form I IIR filters.
       Coefficients below results in bandpass in [479.7Hz, 6432Hz] 3dB point -- see Tim's thesis for pic.
        - b0 = coefficient for x[n] and x[n-2]
        - b1 = coefficient for x[n-1]
        - a0 = coefficient for y[n-1]
        - a1 = coefficient for y[n-2]

        lowpass: b0, b1, a0, a1
                 7892, 15785, 5293, -7479
                 7892, 15782, 3824, -854

        highpass: b0, b1, a0, a1
                  15342, -30687, 31397, -15172
                  15342, -30681, 29836, -13603

        Coefficients in Q15 value. To calculate transfer function, divide each by 2^15.
    */
    //lowpass biquad - stage 1
	r0 = 7892 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = 15785 (x); w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = 5293 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = -7479 (x); w[i0++] = r0.l; w[i0++] = r0.l;

	//highpass biquad - stage 2
	r0 = 15342 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = -30687 (x);w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = 31397 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = -15172 (x);w[i0++] = r0.l; w[i0++] = r0.l;

	//lowpass biquad - stage 3
	r0 = 7892 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = 15782 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = 3824 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = -854 (x);	w[i0++] = r0.l; w[i0++] = r0.l;

	//highpass biquad - stage 4
	r0 = 15342 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = -30681 (x);w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = 29836 (x);	w[i0++] = r0.l; w[i0++] = r0.l;
	r0 = -13603 (x);w[i0++] = r0.l; w[i0++] = r0.l;
lt2_bot: nop;

    /* Populate templates with default values.
       Each 32-bit word contains template values for 4-channels - 1-byte/channel/time-step.
    */
    
    // Template A first -- not in order. From low addr to high: template(t), (t-15), (t-14)...(t-1)
    r0 = 127; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8; //this is the 'new' sample, time t
	            r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t 
	r0 = 113; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8; 
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-15
	r0 = 102; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-14
	r0 = 111; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-13
	r0 = 132; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-12
	r0 = 155; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-11
	r0 = 195; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-10
	r0 = 235; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-9
	r0 = 250; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-8
	r0 = 224; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-7
	r0 = 187; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-6
	r0 = 160; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-5
	r0 = 142; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-4
	r0 = 126; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-3
	r0 = 120; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-2
	r0 = 110; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-1

    // Aperture for template A
    r0.l = 56; r0.h = 56; [i0++] = r0; [i0++] = r0;

    // Template B. In order this time. From low addr to high: template(t), (t-1), ... (t-15).
    r0 = 127; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8; 
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t
	r0 = 113; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-1
	r0 = 102; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-2
	r0 = 111; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-3 
	r0 = 132; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-4 
	r0 = 155; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-5 
	r0 = 195; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-6 
	r0 = 235; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-7 
	r0 = 250; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-8 
	r0 = 224; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-9 
	r0 = 187; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-10 
	r0 = 160; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-11 
	r0 = 142; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-12 
	r0 = 127; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-13 
	r0 = 110; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-14 
	r0 = 95; 	r1 = r0 << 8; r2 = r1 << 8; r3 = r2 << 8;
				r0 = r0 | r1; r0 = r0 | r2; r0 = r0 | r3; [i0++] = r0;  //t-15 

	//aperture: default small.
	r0.l = 56; r0.h = 56; [i0++] = r0; [i0++] = r0;

lt_bot: nop;

    /* Zero the samples in W1 circular buffer. Each loop goes through 1 W1_STRIDE - one sample
       each for four channels.

       Also run 32+31 times so we leave the pointer i1 and i2 at beginning of the last
       W1_STRIDE, to compensate for Intan's pipeline delay.
    */
    p5 = (32+31)*W1_STRIDE*2;
    r0.l = 0x0000;  // ch0-31, ch64-95
    r0.h = 0x0000;  // ch32-63, ch96-127
    lsetup(zer_top, zer_bot) lc0 = p5;
zer_top:
    [i1++] = r0;    // zero delays.
    r1 = [i2++];    // no effect other than keeping pointers in sync. i1 read, i2 writes/follows.
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
    
    r0 = REG4_DSP_SIGNED (z);  // this with DSP filter enabled
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
    //r0 = r4 << 8;
    //r0 = r0 << SHIFT_BITS;
    r0 = NEXT_CHANNEL_SHIFTED;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;                  // call 35

    r4 += 1;
    //r0 = r4 << 8;
    //r0 = r0 << SHIFT_BITS;
    r0 = NEXT_CHANNEL_SHIFTED;
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
wait_16pkts:
    // keep acquiring samples until we have 16 packets ready
    call _get_asm;
    r5 = [FP - FP_QPACKETS];
    cc = bittst(r5, 4);
    if !cc jump wait_16pkts;
    
    // we have 16 pkts now.
    call _get_asm;
    r5 = 0;
    [FP - FP_QPACKETS] = r5;    // start new frame, reset queued pkt number.
    call _clearfifos_asm;       // both method...
    call _clearirq_asm;         // include many _get_asm calls

    // loop to send 16 pkts. Each wp_top iteration sends 1 pkt
    p5 = 16;
    LSETUP(wp_top, wp_bot) lc0 = p5;

    wp_top:
        r7 = SPI_CSN;
        w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
        call _get_asm;
        r6 = 0xa0;  // Nordic SPI command: W_TX_PAYLOAD     
        w[p3] = r6; 
        call _get_asm;
    
        // loop to send 32 bytes - equals 1 packet, 1 byte at a time.
        p5 = 32;
        LSETUP(pb_top, pb_bot) lc1 = p5;
        pb_top:
            r6 = b[p2++];   // p2 is set to the base of packet frames - WFBUF
            w[p3] = r6;     // p2 goe from lo to hi addr. Sending samples first, then template matches.
            call _get_asm;
        pb_bot: nop;

        /* WFBUF has two frames. Memory location for:
             First frame is:  0xff807000 - 0xff8071ff
             Second frame is: 0xff807200 - 0xff8073ff
            
           Make sure p2 does not go past these memory locations - 0xff807400 gets reset to 0xff807000
        */
        r7 = p2;
        bitclr(r7, 10);
        p2 = r7;
        call _get_asm;

        r7 = SPI_CSN | SPI_CE;                  // set the flags for nordic to
        w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7; // transmit this packet!
        call _get_asm;
        r7 = 16;
        r6 = lc0;
        cc = r7 == r6;  // if we are transmitting first packet, don't wait for IRQ. pipeline!
        if cc jump wp_bot;
        // otherwise, wait for asserted IRQ.
        call _waitirq_asm;
        call _clearirq_asm;
    wp_bot: nop;
    // loop finished, still one packet in the radio fifo - wait.
    call _waitirq_asm;
    call _clearirq_asm;
    r7 = SPI_CE;    // disable radio.
    w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
    call _get_asm;

    // put the radio in RX mode now
    //first clear the config register (put in standby mode)
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	r6 = NOR_FLUSH_RX;
	w[p3] = r6;
	call _get_asm;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;

	//now write config register with valid values.
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	r6 = NOR_CONFIG + 0x20; // write to radio's status reg
	w[p3] = r6;
	call _get_asm;
	/** enable CRC for RX of critical values **/
	r6 = NOR_EN_CRC | NOR_CRC0 |
		NOR_MASK_MAX_RT | NOR_PWR_UP | NOR_PRIM_RX;     // write this to the status reg.
	w[p3] = r6;
	call _get_asm;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;
	r7 = SPI_CE; //enable the radio
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;

    // now wait for the status pkt.
    call _waitirq_asm;
    // see if we got something (as opposed to timeout)
    r7 = w[p1];         // p1 points to FIO_FLAG_D @end of _get_asm
    cc = bittst(r7, 3); // check if IRQ is 0 - active-low IRQ interrupt
    if cc jump no_rxpacket;
    
    // otherwise we got a packet. clear irq first though
    call _clearirq_asm;
    r7 = SPI_CE;        // disable the radio;
    w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
    call _get_asm;
    r7 = SPI_CSN;
    w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
    call _get_asm;
    r6 = 0x61;          // command to read radio fifo.
    w[p3] = r6;
    call _get_asm;

    /* rp_top is loop to read the received packet.
       Each packet is 32-bytes long. Response packet format is:
        [4b echo | 28b address] [32b value]
        [4b echo | 28b address] [32b value]
        [4b echo | 28b address] [32b value]
        [4b echo | 28b address] [32b value]
       
        "[]" represents one 32-bit word. Each of the 4 iterations of rp_top reads 8-bytes, and
        extracts the echo value, and the address-value pair.

       The packet is sent by gtkclient, the [4b echo | 28b address] is originally of the form:
        
        lo-addr to hi-addr:
        a0 a1 a2 a3 a4 a5 a6 | a7 a8 a9 a10 a11 a12 a13 a14 | a15 a16 a17 a18 a19 a20 a21 a22 | a23 a24 a25 a26 e0 e1 e2 e3 |

       This is sent to radio via big-endian network-byte-order: hi byte to the lo-addr side,
       So the radio gets: (Note the radio treats lo-addr as LSBit)

        lo-addr to hi-addr:
        a23 a24 a25 a26 e0 e1 e2 e3 | a15 a16 a17 a18 a19 a20 a21 a22 | a7 a8 a9 a10 a11 a12 a13 a14 | a0 a1 a2 a3 a4 a5 a6 |

       When transfering from radio to BFin, radio sends LSByte to MSByte. Within a byte, the MSbit is sent
       first. BFin is configured to receive MSbit first. BFin is in little-endian, meaning MSByte and MSBit
       to higher address. So in one iteration of rp_top, we receive:
            
        MSBit to LSBit
        e3 e2 e1 e0 a26 a25 a24 a23 | a22 a21 a20 a19 a18 a17 a16 a15 | a14 a13 a12 a11 a10 a9 a8 a7 | a6 a5 a4 a3 a2 a1 a0

       This means we can extract echo first, then address, then value, in order.
    */
    p5 = 4;
    LSETUP(rp_top, rp_bot) lc0 = p5;
    rp_top:
        r7 = 0;
        [FP - FP_ADDRESS] = r7;         // reset variable reg to 0
        [FP - FP_VALUE] = r7;           // reset variable reg to 0
        call _get_asm;

        // first nested-loop reads [4b echo | 28b address} and save in FP_address
        p5 = 4;
        LSETUP(a32_top, a32_bot) lc1 = p5;
        a32_top:
            w[p3] = r7; // dummy write
            call _get_asm;
            r7 = w[p3 + (SPI_SHADOW - SPI_TDBR)];   // read byte
            r6 = 0xff;
            r7 = r7 & r6;
            r6 = [FP - FP_ADDRESS];
            r6 = r6 << 8;               // we receive MSByte and MSBit first,
            r6 = r6 + r7;               // shift and add to existing value
            [FP - FP_ADDRESS] = r6;
        a32_bot: nop;

        // now get the [32b value]
        call _get_asm;
        p5 = 4;
        LSETUP(v32_top, v32_bot) lc1 = p5;
        v32_top:
            w[p3] = r7; // dummy write
            call _get_asm;
            r7 = w[p3 + (SPI_SHADOW - SPI_TDBR)];
            r6 = 0xff;
            r7 = r7 & r6;
            r6 = [FP - FP_VALUE];
            r6 = r6 << 8;               // we receive MSByte and MSBit first,
            r6 = r6 + r7;               // shift and add to exiting value
            [FP - FP_VALUE] = r6;
        v32_bot: nop;
        call _get_asm;
        
        // extract the echo flag from top 4 bits held in FP_ADDRESS.
        r7 = [FP - FP_ADDRESS];
        r6 = r7 >> 28;  // shift upper nibble
        p0 = r6;
        p5 = [FP - FP_STATE_LUT_BASE];  
        
        // real memory address always have upper nibble as 0xf. Restore this received address.
        r6 = 0xf;
        r6 = r6 << 28;
        r7 = r7 | r6;           // restored legit memory address!
        [FP - FP_ADDRESS] = r7; // and save it back to variable reg
        
        // go back to figuring out the echo value from the 4bit value
        p5 = (p5 + p0) << 2;    // 4 byte align.
        r7 = [p5];              // echo-flag serves as index into STATE_LUT
        [FP - FP_ECHO] = r7;    // save echo
        call _get_asm;

        // verify address value to be within Bank B...pretty much
        r7 = [FP - FP_ADDRESS];
        r6.h = 0xffef;
        r6.l = 0xc003;
        r5 = r7 & r6;
        r6.h = 0xff80;
        r6.l = 0x4000;
        cc = r5 == r6;
        if !cc jump invalid;
        // valid address - update that address with new value
        p5 = r7;
        r6 = [FP - FP_VALUE];
        [p5] = r6;                // danger danger, value should be 4-bytes. gtkclient take care of this!
        
        invalid:
            call _get_asm;
    rp_bot: nop;
    // pulse _CSN high so we can give radio SPI commands again
    call _get_asm;
    r7 = SPI_CSN;
    w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
    call _get_asm;

no_rxpacket:
    // put it back in TX mode.
    r7 = SPI_CE;    // clear CE
    w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	//flush the TX fifo.
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	r6 = NOR_FLUSH_TX;
	w[p3] = r6;
	call _get_asm;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;

	//now write config register with valid values.
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;
	r6 = NOR_CONFIG + 0x20; // SPI command to write to status register.
	w[p3] = r6;
	call _get_asm;
	r6 = NOR_MASK_MAX_RT | NOR_EN_CRC |
			NOR_CRC0 | NOR_PWR_UP | NOR_PRIM_TX;    // set status reg to this
	w[p3] = r6;
	call _get_asm;
	r7 = SPI_CSN;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r7;
	call _get_asm;

	//reload the watchdog timer -- we are alive! -- happens every transmit/receive cycle
	p5.h = HI(WDOG_STAT);
	p5.l = LO(WDOG_STAT);
	[p5] = r7; //value doesn't matter.
	call _get_asm;

	//blink. first clear LED.
	r7 = LED_BLINK;
	w[p1 + (FIO_FLAG_C - FIO_FLAG_D)] = r7;
	call _get_asm;

	r7 = [FP - FP_BLINK];
	r6 = 1 (z);
	r7 = r7 + r6;
	//flash once every 256 packets. 1/256 duty cycle.
	r6 = r7 >> 4;
	w[p1 + (FIO_FLAG_S - FIO_FLAG_D)] = r6;
	bitclr(r7, 8);
	[FP - FP_BLINK] = r7;
	call _get_asm;

	jump radio_loop;




/*
radio_loop: // main thread, interleaved with _get_asm to process samples
wait_buffer:
    call _get_asm;
    r7 = p4;
    cc = bittst(r7, 10);
    if !cc jump wait_buffer;
we_done:
    jump we_done;
*/
