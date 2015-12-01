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
#define REG4  0x8480    // get back 0xff80
#define REG4_DSP 0x8494 // get back 0xff94
#define REG5  0x8500    // get back 0xff00
#define REG6  0x8600    // get back 0xff00
#define REG7  0x8700    // get back 0xff00
#define REG8  0x8816    // get back 0xff16
#define REG9  0x8900    // get back 0xff00
#define REG10 0x8a17    // get back 0xff17
#define REG11 0x8b00    // get back 0xff00
#define REG12 0x8c15    // get back 0xff15
#define REG13 0x8d00    // get back 0xff00
#define REG14 0x8eff    // get back 0xffff
#define REG15 0x8fff    // get back 0xffff
#define REG16 0x90ff    // get back 0xffff
#define REG17 0x91ff    // get back 0xffff
#define CALIB 0x5500    // get back 0x8000

#define CONVERT0 0x0000

// Change the radio packet formation to make sure the samples are saved correctly!
// Validate with JTAG/GDB debugger.

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
    r1 = [p0 + (SPORT1_RX - SPORT0_RX)];   // SPORT1-primary: Ch32-63
    r0 = [p0 + (SPORT1_RX - SPORT0_RX)];   // SPORT1-sec:     Ch0-31
    r1 >>= SHIFT_BITS;                          // SPORT configured to read 17-bits, so
    r0 >>= SHIFT_BITS;                         // need to shift out the empty LSB
    w[p4++] = r0;   // Save channel on 1st amplifier
    r1 <<= 16;      // Ch32-63 in the upper word
    r2 = r0 + r1;   // r2 = Ch32, Ch0 (lo, hi). 16-bits samples

    // load in new convert command
    r7 = NEXT_CHANNEL_SHIFTED;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 primary TX
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 sec TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 primary TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 sec TX

    // pre-gain, integrator (offset removal), high-pass memory spots
    r5 = [i0++];    // r5.l=32000(pre-gain=0.9765), r5.h=-32768(-1)
    r3 = r0 + r1;   // r2, r3 has sample
.align 8
    r0 = [i1++] || r6 = [i0++];              // both r1 and r2 have samples
    r5 = [i1++] || r7 = [i0++];                         // r5=AGC-gain, r7=sqrt(AGC_target)
    a0 = r3.l * r5.l, a1 = r3.h * r5.h || [i2++] = r2;  // a0,a1=sample*agc_gain. Save samples in "mean" slot
    
    a0 = a0 << 6;       // Originally a0<<8, assuming a0 has 14-bit results.
    a1 = a1 << 6;       // Now it's 16, so shift by 8-2=6
    r0.l = a0, r0.h = a1;

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
    r3 = abs r3 (v) || r7 = [FP-FP_WEIGHTDECAY];    // take abs of gain. r7.l=3, r7.h=0x7fff (0.9999)
    
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

//---------------------------------------------------------------------------------------
    // Process the other two channels in this group. Pretty much identical as before.
    r1 = [p0];   // SPORT0-primary: Ch96-127
    r0 = [p0];   // SPORT0-sec:     Ch64-95
    r1 >>= SHIFT_BITS;
    r0 >>= SHIFT_BITS;
    r1 <<= 16;      // Ch96-127 in the upper word
    r2 = r0 + r1;   // r2 = Ch32, Ch0 (lo, hi). 16-bits samples

    // pre-gain, integrator (offset removal), high-pass memory spots
    r5 = [i0++];    // r5.l=32000(pre-gain=0.9765), r5.h=-32768(-1)
    r3 = r0 + r1;   // r2 and r3 has sample
.align 8
    r0 = [i1++] || r6 = [i0++];              // both r1 and r2 have samples
    r5 = [i1++] || r7 = [i0++];                         // r5=AGC-gain, r7=sqrt(AGC_target)
    a0 = r1.l * r5.l, a1 = r1.h * r5.h || [i2++] = r2;  // a0,a1=sample*agc_gain. Save samples in "mean" slot
    
    a0 = a0 << 6;       // Originally a0<<8, assuming a0 has 14-bit results.
    a1 = a1 << 6;       // Now it's 16, so shift by 8-2=6
    r0.l = a0, r0.h = a1;

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
    r3 = abs r3 (v) || r7 = [FP-FP_WEIGHTDECAY];    // take abs of gain. r7.l=3, r7.h=0x7fff (0.9999)
    
    // Start LMS
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

    // Start 4 back-to-back IIR filters
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
	r3.l = (a0 += r2.l * r5.l), r3.h = (a1 += r2.h * r5.h) (s2rnd);        // r3=y4(n)

    nop || [i2++] = r3; // save current y4(n) in y4(n-1)'s spot
    r2 = [sp++] || [i2++] = r1; // r2=IIR results of ch0-31 and ch32-63. Save y4(n-1) in y4(n-2)'s spot.

    /* Template Comparison starts here, ala Plexon - no threshold.
       Currently, r2 = filtered samples from [Ch32-63 | Ch0-31] (hi, lo).
                  r3 = filterd samples from  [Ch96-127 | Ch64-95] (hi, lo).
       All samples are 16-bits, we right-shift them to 8-bits and byte pack all of them
       into one register (r4) so that it contains the samples for chs[96,64,32,0] (hi to lo).
       The bytes are then converted from signed to unsigned binary offset by XOR with 0x80808080

       Sorting in gtkclient results in 16 template points per channel, 8 bits per point. These templates,
       and the "aperture" for each sorted channels are sent to the headstage, and stored in the 
       corresponding memory location in A1.

       16 previous byte-packed samples (group of 4) are saved in T1. Template matching/spike detection
       consists of using SAA instruction to subtract each of the template point value from the corresponding
       delayed samples. These differences are summed together and compared to the aperture value.

       If the summed differences for a channel is smaller than that channel's aperture, then we detect
       a spike for that channel.

       We do this set of procedures twice, once for template A, then template B, for each channel. At the
       end of the first pass, the current samples are written into T1.
       
       Note that in template comparison comments, all notations in the from ch[96,64,32,0] show data
       from hi-addr to lo-addr.
    */     
    r2 = r2 >>> 8 (v);      // vector-shift samples to 8-bits, preserve sign.
    r3 = r3 >>> 8 (v);
    r4 = bytepack(r2, r3);  // newest sample chs[96,64,32,0] (hi to lo)
    r0 = [FP - FP_8080];    // r0 = 0x80808080
    r4 = r4 ^ r0;           // convert to unsigned offset binary.
    r0 = r4;                // r0 = r4 = new unsigned samples.
.align 8; // Template A   
    a0 = a1 = 0 || r2 = [i0++]; // reset accumulators. r2 = TempA(t).
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //1: Samp(t)-TempA(t). r0=sample(t-15). r2=TempA(t-15)
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //2: Samp(t-15)-TempA(t-15). r0=samp(t-14). r2=TempA(t-14)
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //3: Samp(t-14)-TempA(t-14). r0=samp(t-13). r2=TempA(t-13)
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //4
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //5
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //6
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //7
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //8
/*    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //9
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //10
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //11
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //12
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //13
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //14
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //15: Samp(t-2)-TempA(t-2). r0=samp(t-1). r2=TempA(t-1)
    saa(r1:0, r3:2) || [i3++] = r4;                //16: Samp(t-1)-TempA(t-1). Write new Samp(t)
*/
    
    /* Now results for ch[96,64,32,0] are in [a1.H, a1.L, ao.H, ao.L]. 
       Compare to aperture, as unsigned frac.
    */
/*
    r0 = a0, r1 = a1 (fu) || r2 = [i0++] || i3 += m0; // r2=apertureA[32,0]. i3@Samp(t-6)
    // subtract aperture from results (with saturation)
    r0 = r0 -|- r2 (s) || r3 = [i0++] || i3 -= m3;    // r0=chs[32,0] diff. r3=apertureA[96,64]. i3@Samp(t-8)
    r1 = r1 -|- r3 (s) || i3 += m0;                   // r1=chs[96,64] diff. i3@Samp(t-15)
    r0 = r0 >>> 15 (v); // shift to bit 0, the results of the shifts
    r1 = r1 >>> 15 (v); // will be either -1 or 0.
    r0 = -r0 (v);       // now result will be either 1 or 0.
    r1 = -r1 (v);       // representing either a spike or miss
    r1 <<= 1;
    r6 = r0 + r1;       // r6 in form of: [..14bits..][96A,32A][..14bits..][64A,0A]
.align 8; // Template B
    a0 = a1 = 0 || r0 = [i3++] || r2 = [i0++]; //r0=Samp(t-15). r2=TempB(t-15)
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //1: Samp(t-15)-TempB(t-15). r0=Samp(t-14). r2=TempB(t-14)
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //2: Samp(t-14)-TempB(t-14). r0=Samp(t-13). r2=TempB(t-13)
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //3: Samp(t-13)-TempB(t-13). r0=Samp(t-12). r2=TempB(t-12)
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //4
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //5
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //6
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //7
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //8
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //9
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //10
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //11
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //12
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //13
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //14
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //15: Samp(t-1)-TempB(t-1). r0=Samp(t). r2=TempB(t)
    saa(r1:0, r3:2) || nop;                        //16: Samp(t)-TempB(t). i3@Samp(t-15) of next group.
    // Compare to aperture
    r0 = a0, r1 = a1 (fu) || r2 = [i0++];   // r2=apertureB[32,0].
    r0 = r0 -|- r2 (s) || r3 = [i0++];      // r0=ch[32,0] diff. r3=apertureB[96,64]
    r1 = r1 -|- r3 (s);                     // r1=ch[96,64] diff.
    r0 = r0 >>> 15 (v);
    r1 = r1 >>> 15 (v);
    r0 = -r0 (v);
    r1 = -r1 (v);
    r0 = r0 + r1;
    r0 = r0 + r6;   // r0 in form of: [..12bits..][96B,32B,96A,32A][..12bits..][64B,0B,64A,0A]
*/
//----------------------------------------------------------------------------------------  
    p0 = [FP - FP_CHAN];
    r6 = p0;            // r6 = current group of channels
    
    r0 = 31; 
    cc = r6 == r0;
    
    if !cc jump end_txchan (bp);    // finish if not group31.
    // increment packet num if group 31 
    r5 = [FP - FP_QPACKETS];
    r5 += 1;                       // Finishing cur pkt, so one more on the queue.
    [FP - FP_QPACKETS] = r5;       // Update variable in memory
    
    r4 = 0; 

end_txchan_qs:
    //[FP - FP_QS] = r4;  // if we just finished a pkt, QS=0, otherwise it was incremented already.
    // make p4 loop in WFBUF region
    //r7 = p4;            
    //bitclr(r7, 10);     // two 512-byte frames. loop back after going through 1024 bytes.
    //p4 = r7;
end_txchan:
    p1 = [FP - FP_FIO_FLAG_D];  // reset the pointers.
    p3 = [FP - FP_SPI_TDBR];
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

        To select values for [channel 1, 33, 65, 97], for example, use W1+W1_STRIDE*2*4 instead of W1 to 
        address values in W1 (each group of 4 channels occupy 28 32-bit words)
    */
    // channel 0 
    r0.l = LO(W1);   // ch0 amp or integrator output 
    r0.h = HI(W1);
    [FP - FP_TXCHAN0] = r0;
    // channel 31
    r0.l = LO(W1 + 28*4*31);   
    r0.h = HI(W1 + 28*4*31);
    [FP - FP_TXCHAN1] = r0;
    // channel 32
    r0.l = LO(W1 + 2)    
    r0.h = HI(W1 + 2);
    [FP - FP_TXCHAN2] = r0;
    // channel 63
    r0.l = LO(W1 + 14*4);   
    r0.h = HI(W1 + 14*4);
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
       Our counter will be at 33, this makes our pointers start at the first block, corresponding to
       starting sample acquisition at ch[0,32,64,96]
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

    /* Zero the signal chain intermediate values in W1 circular buffer. Each loop  goes
       through 1 W1_STRIDE. Each W1_STRIDE contains values needed for one group of 4 channels.
       This includes IIR values (y4(n-2), y4(n-1), y3(n-2), y3(n-1), etc), integrator outputs,
       updated-AGC gain, integrator mean.

       Also ran 32+1=33 times so we leave the pointer i1 and i2 at beggining of the last
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
    r0 = REG4_DSP (z);  // this with DSP filter enabled
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
wait_buffer:
    call _get_asm;
    r7 = p4;
    cc = bittst(r7, 10);
    if !cc jump wait_buffer;
we_done:
    jump we_done;
