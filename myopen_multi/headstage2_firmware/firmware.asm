#include "spi.h"
#include "nordic_regs.h"

#define LED_BLINK 0x0010    // blink LED
#define NEXT_CHANNEL 0x3f00 // Intan command CONVERT(63) -- convert next channel

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

       Also when this thread is first started, Intan chip is executing "CONVERT(0)".
       And the command "CONVERT(1)" is in the transmit FIFO.
       
       During "wait_samples", [FP_CHAN] is incremented to 31. The MISO we read from Intan is 
       undefined, as the calibration sequence has just finished. We save this signal chain 
       result to that for Ch31.

       In the main time, the command "CONVERT(1)" is transmitted on MOSI. And CONVERT(63),
       which increment the amplifier channel is loaded into the transmit FIFO. This command
       is the only thing we load into the FIFO in this thread.

       In the next call to _get_asm, [FP_CHAN] increments to 0. The MISO result we get is that
       from CONVERT(0). Thus everything matches from this point on.

       Note: [FP_CHAN] = 30 means the content of the memory address pointed by FP_CHAN contains 30.
    */
wait_samples:
    r3 = w[p0 + (SPORT0_STAT - SPORT0_RX)];
    cc = bittst(r3, 0);
    if !cc jump wait_samples;

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
    r1 = w[p0 + (SPORT1_RX - SPORT0_RX)] (z);   // SPORT1-primary: Ch32-63
    r0 = w[p0 + (SPORT1_RX - SPORT0_RX)] (z);   // SPORT1-sec:     Ch0-31
    r2.l = 0xffff;  // word read is 16-bits, no longer 12-bits.
    r0 = r0 & r2;
    r1 = r1 & r2;
    r1 <<= 16;      // Ch32-63 in the upper word
    r2 = r0 + r1;   // r2 = Ch32, Ch0 (lo, hi). 16-bits samples

    // queue CONVERT63 in transmit FIFO. This step is a lot easier than the RHA version's code.
    r7 = NEXT_CHANNEL;
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r7 (z);   // SPORT0 primary TX
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r7 (z);   // SPORT0 sec TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r7 (z);   // SPORT1 primary TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r7 (z);   // SPORT1 sec TX
    
    // integrator (offset removal), highpass, and gain stage
    r5 = [i0++]; // r5 = 32000 (pre-gain=0.9765), -16384 (lo, hi)
.align 8
    // In comments r6.h = 1600(mu=0.0488) means r6.h contains 1600, which is 0.0488 in Q15 format
    // Multiply-accumulate default option is Q15 (signed frac) with saturation.
    
    a0 = r2.l * r5.l, a1 = r2.h * r5.l || r1 = [i1++];  // a0 = gain scaled sample; r1 = prev integrated mean
    r6 = [i0++];                                        // r6.l = 16384 (0.5), r6.h = 1600 (mu=0.0488)
    r0.l = (a0 -= r1.l), r0.h = (a0 -= r1.h);           // r0 = output of stage = y = gx-previous integr mean
    a0 = r1.l, a1 = r1.h;                               // a0, a1 contains prev integrated mean
    r2.l = (a0 += r0.l * r6.h), r2.h = (a1 += r0.h * r6.h) || r5 = [i1++] || r7 = [i0++];
    
    /* r2 = new integr mean = mu*y+prev integr mean;
       r5 = AGC gain (lo, hi are diff), r7 = sqrt of AGC target (lo, hi are the same)
       We now start AGC
    */
    a0 = r0.l * r5.l, a1 = r0.h * r5.h || [i2++] = r2;  // a0,a1  = y * agc_gain. Save new mean in r2.
    a0 = a0 << 6;           // In Tim's firmware, a0 is shifted by 8, given a0 here starts out being 14-bits.
    a1 = a1 << 6;           // Here a0 starts out being 16-bits, so we shift 2 bits less to the left.
    r0.l = a0, r0.h = a1;   // r0 contains the 16-bits output of AGC stage, let it be y.
    
    /* Now we update AGC-gain.
       AGC-gain is in Q7.8 format - max is 128.
       
       We take the difference of agc_gain*integrator_output and the AGC-target. If this difference is
       positive or negative, we subtract or add 2^-8 to the original gain and save the abs-value as the
       new gain.

       Adding 2^-8 at a time because r6.h=1, which is 2^-8 in Q7.8 format.
    */
    a0 = abs a0, a1 = abs a1;
    r4.l = (a0 -= r7.l * r7.l), r4.h = (a1 -= r7.h * r7.h) (is) // subtract target from value, saturate diff
        || r6 = [i0++];                                         // r6.l = 16384 (0.5), r6.h = 1
    a0 = r5.l * r6.l, a1 = r5.h * r6.l || nop;
    r3.l = (a0 -= r4.l * r6.h), r3.h = (a1 -= r4.h * r6.h) (s2rnd) || nop;  // inc or dec gain
.align 8
    r3 = abs r3 (v) || r7 = [FP - FP_WEIGHTDECAY];  // take abs of gain. r7.l = 3, r7.h = 0x7fff (0.9999)

    /* Start LMS adaptive noise remover.
    
       At this point r0 contains the output of the AGC stage. Call this x(n, c), where n=cur sample,
       n-1 is the previous sample, etc; c is current channel, c-1 is the previous channel (on same chip).

       LMS tries to remove noise from the current channel sample (in r0) by subtracting a linear 
       combination of samples from the 7 previous channels ( x(n,c-1%32), x(n,c-2%32)...). The linear
       combination is the noise. The difference is saved as output of LMS stage.

       The LMS weights(numbers multiplying the previous channel samples) are then updated by:
       1) The incoming sample (in r0) is first saturated after multiplying by 3 (as signed integer). This
          saturated sample is saved.
       2) LMS(n,0) is the weight corresponding to x(n,c-1%32). This is updated by:
            - multiplying saturated x(n,c-1%32) with the sign of the noise removed from current sample.
            - adding the previous product to LMS(n,0) to obtain the new LMS(n,0).
       3) This is then saved.
       
       Therefore the weight increase if the sample and error have the same sign.

       Memory management:
       1) i1 currently points at the present channel's previous saturated sample -- x(n-1, c) in W1 buffer.
          m1 = -784 -> i1+m1 will point to x(n, c-8%32)...move i1 back 8 W1_STRIDE back.
          m2 = 112  -> i1+m2 will point to x(n-1, c+1%32)...move i1 forward 1 W1_STRIDE.
          Note that channels before c have x(n), channels after c have x(n-1).
          n denotes current iteration of the 32-channels on an amplifier.
       2) i0 currently points at LMS(n,6) in A1 buffer. Let LMS(n,0)=w0, LMS(n,1)=w1, .. 
          m3 = 8    -> i0+m3 will point to LMS(n,4)...it moves pointer two weights up.
          m0 = -28  -> i0+m0 will point at LMS(n,6) if i0 is moved to 1 after LMS(n,0)
                       ...it resets the pointer back to first LMS weight.
    */
    r4.l = (a0 = r0.l * r7.l), r4.h = (a1 = r0.h * r7.l) (is) || i1 += m1 || [i2++] = r3;
        // Saturate the sample (now in r4). Move i1 back 8 W1_STRIDE. Save r3 - new AGC gain.
    mnop || r1 = [i1++] || [i2++] = r4;   // Move i1 to non-saturated x(n,c-8%32). Save saturated sample.
    mnop || r1 = [i1++m2] || r2 = [i0++]; // Move i1 to non-sat x(n,c-7%32). r2=w6, i0@w5.

    // Start summing samples and corresponding LMS weights.
    a0 = r1.l * r2.l, a1 = r1.h * r2.h || r1 = [i1++m2] || r2 = [i0++]; // r2=w5, i0@w4
	a0+= r1.l * r2.l, a1+= r1.h * r2.h || r1 = [i1++m2] || r2 = [i0++]; // r2=w4, i0@w3
	a0+= r1.l * r2.l, a1+= r1.h * r2.h || r1 = [i1++m2] || r2 = [i0++]; // r2=w3, i0@w2
	a0+= r1.l * r2.l, a1+= r1.h * r2.h || r1 = [i1++m2] || r2 = [i0++]; // r2=w2, i0@w1
	a0+= r1.l * r2.l, a1+= r1.h * r2.h || r1 = [i1++m2] || r2 = [i0++]; // r2=w1, i0@w0
	a0+= r1.l * r2.l, a1+= r1.h * r2.h || r1 = [i1++m2] || r2 = [i0++]; // r2=w0, i0@IIR LPF1 b0
    r6.l = (a0 += r1.l * r2.l), r6.h = (a1 += r1.h * r2.h) || r1 = [i1++m1] || r2 = [i0++m0];
        // r6 = sum = noise for cur channel. Move i1 back 8 chans. i0 @ w6.
    
    r0 = r0 -|- r6 (s) || [i2++] = r0 || r1 = [i1--];  // New r0 = sample w/ noise removed = LMS out = y
                                                       // Save AGC result. Move i1 to saturated samples.
    r6 = r0 >>> 15 (v, s) || r1 = [i1++m2] || r2 = [i0++];  // r6=sign(y). r1=sat x(n,c-7%32). r2=w6. i0@w5
.align 8
    // LMS weight update with weight-decay term
    a0 = r2.l * r7.h, a1 = r2.h * r7.h || nop || nop;
r5.l = (a0 += r1.l * r6.l), r5.h = (a1 += r1.h * r6.h) || r1 = [i1++m2] || r2 = [i0--]; // r2=w5, i0@w6
    a0 = r2.l * r7.h, a1 = r2.h * r7.h || [i0++m3] = r5;                                // Update w6. i0@w4.

r5.l = (a0 += r1.l * r6.l), r5.h = (a1 += r1.h * r6.h) || r1 = [i1++m2] || r2 = [i0--]; // r2=w4, i0@w5
    a0 = r2.l * r7.h, a1 = r2.h * r7.h || [i0++m3] = r5;                                // Update w5, i0@w3

r5.l = (a0 += r1.l * r6.l), r5.h = (a1 += r1.h * r6.h) || r1 = [i1++m2] || r2 = [i0--]; // r2=w3, i0@w4
    a0 = r2.l * r7.h, a1 = r2.h * r7.h || [i0++m3] = r5;                                // Update w4, i0@w2

r5.l = (a0 += r1.l * r6.l), r5.h = (a1 += r1.h * r6.h) || r1 = [i1++m2] || r2 = [i0--]; // r2=w2, i0@w3
    a0 = r2.l * r7.h, a1 = r2.h * r7.h || [i0++m3] = r5;                                // Update w3, i0@w1

r5.l = (a0 += r1.l * r6.l), r5.h = (a1 += r1.h * r6.h) || r1 = [i1++m2] || r2 = [i0--]; // r2=w1, i0@w2
    a0 = r2.l * r7.h, a1 = r2.h * r7.h || [i0++m3] = r5;                                // Update w2, i0@w0

r5.l = (a0 += r1.l * r6.l), r5.h = (a1 += r1.h * r6.h) || r1 = [i1++m2] || r2 = [i0--]; // r2=w0, i0@w1
    a0 = r2.l * r7.h, a1 = r2.h * r7.h || [i0++m3] = r5;                                // Update w1, i0@b0

r5.l = (a0 += r1.l * r6.l), r5.h = (a1 += r1.h * r6.h) || r1 = [i1++m3] || r2 = [i0--]; // i1@x1(n-1). i0@w0
    mnop || [i0++] = r5;    // Update w0. i0@b0.

    /* Start 4 back-to-back direct-form 1 biquads. Operates on the two samples in
       parallel (both in 1 32-bit reg). See Tim thesis for block diagrams.

       At this point,
         r0: contains the output of LMS.
         i0: @LPF1's b0. For reading/writing A1.
         i1: @x1(n-1) of current channel. For reading existing values in W1.
         i2: @x1(n-1) of current channel. For updating those values afterwards, also in W1.

       If i1 and i2 are dereferenced in the same cycle, the processor will stall -- each of the
       1k SRAM memory banks has only one port.

       Format of existing values/delayed samples in memory (W1 buffer), each line = 32-bit word, 
       each 32-bit word contains value for both channels, 16-bits each:
       
       [x1(n-1) ,               <-- lo addr
        x1(n-2) ,
        x2(n-1) aka y1(n-1) ,
        x2(n-2) aka y1(n-2) ,
        x3(n-1) aka y2(n-1) ,
        x3(n-2) aka y2(n-2) ,
        x4(n-1) aka y3(n-1) ,
        x4(n-2) aka y3(n-2) ,
        y4(n-1) ,
        y4(n-2) ]               <-- hi addr
    */
    mnop || r5 = [i0++] || r1 = [i1++];                                   // r0=samp; r1=x1(n-1); r5=b0.0
	a0  = r0.l * r5.l, a1  = r0.h * r5.h || r6 = [i0++] || r2 = [i1++] ;           // r6=b0.1; r2=x1(n-2)
	a0 += r1.l * r6.l, a1 += r1.h * r6.h || r7 = [i0++] || r3 = [i1++];            // r7=a0.0; r3=y1(n-1)
	a0 += r2.l * r5.l, a1 += r2.h * r5.h || r5 = [i0++] || r4 = [i1++] ;           // r5=a0.1; r4= 1(n-2)
	a0 += r3.l * r7.l, a1 += r3.h * r7.h || [i2++] = r0 ;                          // save x1(n-1)
	r0.l = (a0 += r4.l * r5.l), r0.h = (a1 += r4.h * r5.h) (s2rnd) || [i2++] = r1; // r0=y1(n); save x1(n-2)

	r5 = [i0++] || [i2++] = r0;                                            // r5=b1.0; save y1(n-1)
	a0  = r0.l * r5.l, a1  = r0.h * r5.h || r6 = [i0++] || [i2++] = r3;    // r6=b1.1; save y1(n-2)
	a0 += r3.l * r6.l, a1 += r3.h * r6.h || r7 = [i0++] || r1 = [i1++];    // r7=a1.0; r1 = y2(n-1)
	a0 += r4.l * r5.l, a1 += r4.h * r5.h || r2 = [i1++];                   // r2=y2(n-2)
	a0 += r1.l * r7.l, a1 += r1.h * r7.h || r5 = [i0++];                   // r5=a1.1
	r0.l = (a0 += r2.l * r5.l), r0.h = (a1 += r2.h * r5.h) (s2rnd) || NOP; // r0=y2(n)

	r5 = [i0++] || [i2++] = r0;                                            // r5=b2.0; save y2(n-1)
	a0  = r0.l * r5.l, a1  = r0.h * r5.h || r6 = [i0++] || [i2++] = r1;    // r6=b2.1; save y2(n-2)
	a0 += r1.l * r6.l, a1 += r1.h * r6.h || r7 = [i0++] || r3 = [i1++];    // r7=a2.0; r3=y3(n-1)
	a0 += r2.l * r5.l, a1 += r2.h * r5.h || r4 = [i1++];                   // r4=y3(n-2)
	a0 += r3.l * r7.l, a1 += r3.h * r7.h || r5 = [i0++];                   // r5=a2.1
	r0.l = (a0 += r4.l * r5.l), r0.h = (a1 += r4.h * r5.h) (s2rnd) || NOP; // r0=y3(n)

	r5 = [i0++] || [i2++] = r0;                                            // r5=b3.0; save y3(n-1)
	a0  = r0.l * r5.l, a1  = r0.h * r5.h || r6 = [i0++] || [i2++] = r3;    // r6=b3.1; save y3(n-2)
	a0 += r3.l * r6.l, a1 += r3.h * r6.h || r7 = [i0++] || r1 = [i1++];    // r7=a3.0; r1= y4(n-1)
	a0 += r4.l * r5.l, a1 += r4.h * r5.h || r2 = [i1++];                   // r2=y4(n-2)
	a0 += r1.l * r7.l, a1 += r1.h * r7.h || r5 = [i0++];                   // r5=a3.1
	r0.l = (a0 += r2.l * r5.l), r0.h = (a1 += r2.h * r5.h) (s2rnd);        // r0=y4(n)

	[i2++] = r0; // save current y4(n) in y4(n-1)'s spot.
	[i2++] = r1; // save current y4(n-1) in y4(n-2)'s spot. (normally pipelined)
	[--sp] = r0; // store IIR result (current y4(n)) on the stack.

       
       
            
         





   
    

    
    






.global radio_bidi_asm
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
    r0,h = HI(ENC_LUT);
    [FP - FP_ENC_LUT_BASE] = r0;    // addressed byte-wise; no align needed.
    r0.l = LO(STATE_LUT);
    r0.h = HI(STATE_LUT);
    r0 = r0 >> 2;                   // because we use add with shift for 4-byte word alignment.
    [FP - FP_STATE_LUT_BASE] = r0;  // this makes future binary math easy (see later echo-flag extraction)

    /* Setup default pointers of values to transmit.
       Memory layout is little-endian.
       Note that only 8-bits of the selected sample can be transmitted in a radio-sample. Thus
       the pointer should point to the higher byte of 16-bits word holding that sample.

        To select values for [channel 1, 33, 65, 97], for example, use W1+W1_STRIDE*2*4 instead of W1 to 
        address values in W1 (each group of 4 channels occupy 28 32-bit words)
    */
    // channel 0 
    r0.l = LO(W1 + 12*4 + 0 + 1);   // select value of IIR filter y4(n-1) -- result of signal chain
    r0.h = HI(W1 + 12*4 + 0 + 1);
    [FP - FP_TXCHAN0] = r0;
    // channel 32
    r0.l = LO(W1 + 12*4 + 2 + 1);   // select value of IIR filter y4(n-1)
    r0.h = HI(W1 + 12*4 + 2 + 1);
    [FP - FP_TXCHAN1] = r0;
    // channel 64
    r0.l = LO(W1 + 26*4 + 0 + 1);   // select value of IIR filter y4(n-1)
    r0.h = HI(W1 + 26*4 + 0 + 1);
    [FP - FP_TXCHAN2] = r0;
    // channel 96
    r0.l = LO(W1 + 26*4 + 2 + 1);
    r0.h = HI(W1 + 26*4 + 2 + 1);
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

    // i1 is for reading the W1 circular buffer -- contains the value of the signal chain at each stage.
    i1.l = LO(W1);
    i1.h = HI(W1);
    l1 = W1_STRIDE*2*32*4;  // 28 32-bit words/channel, 32 channels total. This is number of bytes
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
       Our counter is however 63. This makes the circular buffer pointer starts at the last A1-stride,
       This is to compensate for the two-cycle delays between sending convert-command to getting the
       specified sample back from ADC. This corresponds to FP_CHAN starting at 30 = 31-1.
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
    r0.l = 32000;   w[i0++] = r0.l;
    r0.l = -16384;  w[i0++] = r0.l;
    r0.l = 16384;   w[i0++] = r0.l;
    r0.l = 1600;    w[i0++] = r0,l; // mu changed from 800 to 1600, because we no longer do s2rnd
                                    // in integrator stage.
    
    /* AGC: 
        Target is 6000*16384, which in Q15 is ~0.09155. We store just the target's square
        root (in Q15). This is so we can later accomodate big target values.
    */
    r0.l = 9915;    w[i0++] = r0.l;     // AGC target sqrt = sqrt(6000*16384), Q15.
    r0.l = 9915;    w[i0++] = r0.l;     // AGC target sqrt = sqrt(6000*16384), Q15.
    r0.l = 16384;   w[i0++] = r0.l;     // Q15, =0.5
    r0.l = 1;       w[i0++] = r0.l;     // Set this to zero to disable AGC. Q7.8

    // LMS coefs - 7 total.
    r0 = 0(x);
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

    /* Zero the signal chain intermediate values in W1 circular buffer. Each loop  goes
       through 1 W1_STRIDE. Each W1_STRIDE contains values needed for one group of 4 channels.
       This includes IIR values (y4(n-2), y4(n-1), y3(n-2), y3(n-1), etc), integrator outputs,
       updated-AGC gain, integrator mean.

       Also ran 32+31=63 times so we leave the pointer i1 and i2 at beggining of the last
       W1_STRIDE, to compensate for Intan's pipeline delay.
    */
    p5 = (32+31)*W1_STRIDE*2;
    r0 = 0;
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
    // SPORT0 transmit
    p5.l = LO(SPORT0_TCR1);
    p5.h = LO(SPORT0_TCR1);
    r0.l = 0x7602;
    w[p5] = r0;
    
    // SPORT0 receive
    p5.l = LO(SPORT0_RCR1);
    p5.h = HI(SPORT0_RCR1);
    r0.l = 0x7401;
    w[p5] = r0;

    // SPORT1 transmit
    p5.l = LO(SPORT1_TCR1);
    p5.h = LO(SPORT1_TCR1);
    r0.l = 0x7602;
    w[p5] = r0;
    
    // SPORT0 receive
    p5.l = LO(SPORT1_RCR1);
    p5.h = HI(SPORT1_RCR1);
    r0.l = 0x7401;
    w[p5] = r0;
    ssync;

intan_setup:    // clock cycle and FIFO contents for this process in intan_setup spreadsheet.
    r0 = 0x80fe (z);    // Write 0xFE to Intan reg 0
    p0 = [FP - FP_SPORT0_RX];
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 primary TX
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 sec TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 primary TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 sec TX

    r0 = 0x8102 (z);    // Write 0x02 to Intan reg 1
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 primary TX
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 sec TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 primary TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 sec TX

    r0 = 0x8204 (z);    // Write 0x04 to Intan reg 2
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 primary TX
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 sec TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 primary TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 sec TX

    r0 = 0x8300 (z);    // Write 0x00 to Intan reg 3
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 primary TX
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 sec TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 primary TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 sec TX

    /* Transmit FIFO is now completely full, two will be transmitted every frame-sync cycle.
       Refill two words (same command to both pri and sec) every cycle
    */
    r0 = 0x8480 (z);    // Write 0x80 to Intan reg 4
    call _config_wait_asm;

    r0 = 0x8500 (z);    // Write 0x00 to Intan reg 5
    call _config_wait_asm;

    r0 = 0x8600 (z);    // Write 0x00 to Intan reg 6
    call _config_wait_asm;

    r0 = 0x8700 (z);    // Write 0x00 to Intan reg 7
    call _config_wait_asm;
    
    r0 = 0x8816 (z);    // Write 0x16 to Intan reg 8
    call _config_wait_asm;

    r0 = 0x8900 (z);    // Write 0x00 to Intan reg 9
    call _config_wait_asm;

    r0 = 0x8a17 (z);    // Write 0x17 to Intan reg 10
    call _config_wait_asm;

    r0 = 0x8b00 (z);    // Write 0x00 to Intan reg 11
    call _config_wait_asm;

    r0 = 0x8c15 (z);    // Write 0x15 to Intan reg 12
    call _config_wait_asm;

    r0 = 0x8d00 (z);    // Write 0x00 to Intan reg 13
    call _config_wait_asm;
    
    r0 = 0x8eff (z);    // Write 0xff to Intan reg 14
    call _config_wait_asm;

    r0 = 0x8fff (z);    // Write 0xff to Intan reg 15
    call _config_wait_asm;

    r0 = 0x90ff (z);    // Write 0xff to Intan reg 16
    call _config_wait_asm;

    r0 = 0x91ff (z);    // Write 0xff to Intan reg 17
    call _config_wait_asm;
    
    // Finished all writes to Intan regs. Wait for all commands to finish.
    r0 = 0xfe00 (z);    // Read Intan reg 62 -- dummy command so Intan doesn't run anything
    call _config_wait_asm;
    call _config_wait_asm;

    /* Intan reg 0 sets fast-settle. Amplifier f_H set to 7.5kHz through Intan reg8-11 values.
       This means we have to wait 2.5/7.5k = 333us, before turning fast-settle off.
       At this point we are 18 frame-syncs after fast-settle is set, this is about 18us.
       Need to wait 295us more. Do this by calling 295 _config_wait_asm times...
    */
    r2 = 295;
    r3 = 0;
fast_settle_loop:
    _config_wait_asm;
    r2 += -1;
    cc = r2 == r3
    if !cc jump fast_settle_loop;

    // finished settling, turn fast-settle off
    r0 = 0x80de (z);    // Write 0xde to Intan reg 0
    call _config_wait_asm;

    /* Initiate ADC self-calibration routine.
       Intan datasheet: 9 "dummy" commands must be sent after a CALIBRATE command to generate 
                        necessary SCLK cycles. The nine commands following a CALIBRATE
                        command are not executed by the RHD2000; the chip ignores other operations
                        until calibration is complete.
    */
    r0 = 0x5500 (z);    // CALIBRATE command
    call _config_wait_asm;

    // start the 9 dummy cycles
    r2 = 9;
    r0 = 0xfe00 (z);    // dummy command...anything other than 0x5500 is ok
ADC_calibrate_loop:
    _config_wait_asm;
    r2 += -1;
    cc = r2 == r3;
    if !cc jump ADC_calibrate_loop;

    // queue up CONVERT0. At this point, the transmit FIFO is full.
    // channel0 result will be read out on MISO in 6 frame-syncs.
    r0 = 0x0000 (z);    // CONVERT(0)
    call _config_wait_asm;

    call _nofill_wait_asm;
    call _nofill_wait_asm;
    call _nofill_wait_asm;  // end of this call, transmit FIFO contains only CONVERT(0)

    r0 = 1 (z);
    r0 <<= 8;   // CONVERT (1) command
    call _config_wait_asm;  // end of this call, transmit FIFO contains only CONVERT(1)
    
    // finish all setup
    p1.l = LO(FIO_FLAG_D);  // restore p1 value,
    p1.h = HI(FIO_FLAG_D);  // expected by radio_loop and _get_asm

    jump radio_loop;
    
_config_wait_asm:    // Wait for the read/write to Intan to complete 
    r1 = w[p0 + (SPORT0_STAT - SPORT0_RX)];
    cc = ! bittst(r1, 0);
    if cc jump _config_wait_asm;
    
    // Read the samples out of both receive FIFOs to clear space
    r1 = w[p0] (z); // SPORT0_RX pri
    r1 = w[p0] (z); // SPORT0_RX sec
    r1 = w[p0 + (SPORT1_RX - SPORT0_RX)] (z); // SPORT1_RX pri
    r1 = w[p0 + (SPORT1_RX - SPORT0_RX)] (z); // SPORT1_RX sec 

    // Queue up the new command word in r0 prior to calling this routine.
    // This command will be transmitted in 4 frame sync cycles.
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 primary TX
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r0;   // SPORT0 sec TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 primary TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;   // SPORT1 sec TX
    rts;

_nofill_wait_asm:   
    // Wait for the read/write to Intan to complete, no write to transmit FIFO
    r1 = w[p0 + (SPORT0_STAT - SPORT0_RX)];
    cc = ! bittst(r1, 0);
    if cc jump _nofill_wait_asm;
    
    // Read the samples out of both receive FIFOs to clear space
    r1 = w[p0] (z); // SPORT0_RX pri
    r1 = w[p0] (z); // SPORT0_RX sec
    r1 = w[p0 + (SPORT1_RX - SPORT0_RX)] (z); // SPORT1_RX pri
    r1 = w[p0 + (SPORT1_RX - SPORT0_RX)] (z); // SPORT1_RX sec 
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
        LSETUP(pb_top, pb_ot) lc1 = p5;
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
        call _get_asm;A

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

no_rx_packet:
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
