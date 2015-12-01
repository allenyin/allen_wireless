#include "spi.h"
#include "nordic_regs.h"

#define LED_BLINK 0x0010    // blink LED
#define NEXT_CHANNEL 0x3f00 // Intan command CONVERT(63) -- convert next channel
#define SHIFT_BITS 1        // SPORT may configure for more than 16-bit read/write...compensate
#define SAMPLE_SHIFT 5      // =SHIFT_BITS+4, to get sample down to 12-bits. 

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

.align 8    // call is a 5-cycle latency if target is aligned.
_get_asm:
    /* Sampling thread:
       Reads in data, apply offset removal/high-pass, AGC gain, LMS, and IIR.
       Clobbers almost all registers. But it's ok.
    */

    // Reset p0 to point to SPORT0_RX.
    p0 = [FP - FP_SPORT0_RX];
    
    /* When this thread first starts running, [FP_CHAN] = 31. This reg holds the
       current channel and is incremented before actually reading the samples.
       Therefore, after incrementing, this value will be the channel number corresponding
       to that being read out on MOSI.

       The SPORT pipeline is setup such that, when _get_asm is first executed, we have:
            FIFO: CONVERT(3)
            MOSI: CONVERT(2)
            ADC:  CONVERT(1)
            MISO: CONVERT(0) result.

       Thus the initial [FP_CHAN]=31 value is incremented to 0, corresponding with MISO result.

       After reading MISO, CONVERT(4) will need to be loaded, thus the channel to be loaded is
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
    r2 = 0xffff (z);  // mask
    r0 = r0 & r2;
    r1 = r1 & r2;
    r1 <<= 16;      // Ch32-63 in the upper word
    r2 = r0 + r1;   // r2 = Ch32, Ch0 (lo, hi). 16-bits samples

    // load in new convert command
    r6 += 4;
    bitclr(r6, 5);
    r7 = r6 << 8;
    r7 = r7 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 primary TX
    [p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 sec TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 primary TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 sec TX
    
    // In comments, r6.h = 1600(mu=0.0488) means r6.h contains 1600, which is 0.0488 in Q15 format
    // Multiply-accumulate default option is Q15 (signed frac) with saturation.
    
    // pre-gain, integrator (offset removal), high-pass
    r5 = [i0++]; // r5.l = 32000(pre-gain=0.9765), r5.h=-32768(-1)
.align 8
    a0 = r2.l * r5.l, a1 = r2.h * r5.l || r1 = [i1++];   // a0 = gain scaled sample. r1 = prev integ mean
    a0 += r2.l * r5.l, a1 += r2.h * r5.l || r6 = [i0++]; // r6.l = 16384 (0.5), r6.h = 800 (mu)
    r0.l = (a0 += r1.l * r5.h), r0.h = (a1 += r1.h * r5.h) (s2rnd); // r0=output of stage=y=g*x-prev_mean
    a0 = r1.l * r6.l, a1 = r1.h * r6.l;                             // a0,a1=mu*y
    //r2.l = (a0 += r0.l * r6.h), r2.h = (a1 += r0.h * r6.h) (s2rnd)  // r2=new integ mean=prev_mean+mu*y
         r5 = [i1++] || r7 = [i0++];                              // r5=AGC_gain, r7=sqrt(AGC_target)
    a0 = r0.l * r5.l, a1 = r0.h * r5.h || [i2++] = r2;              // a0,a1=y*agc_gain. Save new mean in r2

    a0 = a0 << 8;           // Tim says "14 bits in SRC (note *r above), amp to 16 bits, which leaves 2 more
    a1 = a1 << 8;           // bits for amplification. AGC_gain is [0,128]. Makes no sense to me..
    r0.l = a0, r0.h = a1;

    /* For not having another high-pass stage...remember to change the first two 32-bit words in A1-frames.
    r3.l = r2.l * r5.l, r3.h = r2.h * r5.l || r1 = [i1++];  // r3=gain scaled sample; r1=prev sample
    r6 = [i0++];                                            // r6.l, r6.h = 16384, placeholders
    r2.l = r2.l * r5.l, r2.h = r2.h * r5.l || r5 = [i1++] || r7 = [i0++]; // r2=r3=scaled samples. 
                                                                          // r5=AGC gain
                                                                          // r7=sqrt(AGC_gain)
    // AGC
    a0 = r3.l * r5.l, a1 = r3.h * r5.h || [i2++] = r2; // a0,a1=scaled_sample*agc_gain. Save scaled sample r2
    a0 = a0 << 6;
    a1 = a1 << 6;
    r0.l = a0, r0.h = a1;                              // r0=output of AGC stage
    */
    
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

    // Process the other two channels in this group. Pretty much identical as before.
    r1 = [p0];   // SPORT0-primary: Ch96-127
    r0 = [p0];   // SPORT0-sec:     Ch64-95
    r1 >>= SHIFT_BITS;
    r0 >>= SHIFT_BITS;
    r2 = 0xffff (z);  // 12-bit mask 
    r0 = r0 & r2;
    r1 = r1 & r2;
    r1 <<= 16;      // Ch96-127 in the upper word
    r2 = r0 + r1;   // r2 = Ch32, Ch0 (lo, hi). 16-bits samples
  
    // pregain, integrator + highpass
    r5 = [i0++]; // r5.l=32000, r5.h=-16384 
.align 8
    a0 = r2.l * r5.l, a1 = r2.h * r5.l || r1 = [i1++];   // a0 = gain scaled sample. r1 = prev integ mean
    a0 += r2.l * r5.l, a1 += r2.h * r5.l || r6 = [i0++]; // r6.l = 16384 (0.5), r6.h = 800 (mu)
    r0.l = (a0 += r1.l * r5.h), r0.h = (a1 += r1.h * r5.h) (s2rnd); // r0=output of stage=y=g*x-prev_mean
    a0 = r1.l * r6.l, a1 = r1.h * r6.l;                             // a0,a1=mu*y
    //r2.l = (a0 += r0.l * r6.h), r2.h = (a1 += r0.h * r6.h) (s2rnd)  // r2=new integ mean=prev_mean+mu*y
    r5 = [i1++] || r7 = [i0++];                              // r5=AGC_gain, r7=sqrt(AGC_target)
    a0 = r0.l * r5.l, a1 = r0.h * r5.h || [i2++] = r2;              // a0,a1=y*agc_gain. Save new mean in r2

    a0 = a0 << 8;           // Tim says "14 bits in SRC (note *r above), amp to 16 bits, which leaves 2 more
    a1 = a1 << 8;           // bits for amplification. AGC_gain is [0,128]. Makes no sense to me..
    r0.l = a0, r0.h = a1;

    /*  Code for not using integrator/highpass stage
    r3.l = r2.l * r5.l, r3.h = r2.h * r5.l || r1 = [i1++];
    r6 = [i0++];
    r2.l = r2.l * r5.l, r2.h = r2.h * r5.l || r5 = [i1++] || r7 = [i0++];

    // start AGC
    a0 = r3.l * r5.l, a1 = r3.h * r5.h || [i2++] = r2;
    a0 = a0 << 6; 
    a1 = a1 << 6;
    r0.l = a0, r0.h = a1;
    */

    // Update AGC-gain
    a0 = abs a0, a1 = abs a1;
    r4.l = (a0 -= r7.l * r7.l), r4.h = (a1 -= r7.h * r7.h) (is) // subtract target from value, saturate diff
        || r6 = [i0++];                                         // r6.l = 16384 (0.5), r6.h = 1
    a0 = r5.l * r6.l, a1 = r5.h * r6.l || nop;
    r3.l = (a0 -= r4.l * r6.h), r3.h = (a1 -= r4.h * r6.h) (s2rnd) || nop;  // inc or dec gain
.align 8
    r3 = abs r3 (v) || r7 = [FP - FP_WEIGHTDECAY];  // r3=abs of new gain. r7.l = 3, r7.h = 0x7fff (0.9999)

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
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //9
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //10
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //11
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //12
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //13
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //14
    saa(r1:0, r3:2) || r0 = [i3++] || r2 = [i0++]; //15: Samp(t-2)-TempA(t-2). r0=samp(t-1). r2=TempA(t-1)
    saa(r1:0, r3:2) || [i3++] = r4;                //16: Samp(t-1)-TempA(t-1). Write new Samp(t)
    
    /* Now results for ch[96,64,32,0] are in [a1.H, a1.L, ao.H, ao.L]. 
       Compare to aperture, as unsigned frac.
    */
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

    p0 = [FP - FP_CHAN];
    p1 = [FP - FP_ENC_LUT_BASE];  // 3 cycle latency before we can use p1
    p5 = [FP - FP_MATCH_BASE];
    r0.h = r0.h << 4;
    r0.l = r0.l + r0.h; // r0.l is now [...8bits][96B,32B,96A,32A,64B,0B,64A,0A]
    r0 = r0.b(z);       // zero-out everything in r0, except for the lower byte.
    r6 = p0;            // r6 = current group of channels
    
    // Now we update the spike results in the MATCH (8b) buffer.
    p5 = p5 + p0;       // p5 points to the byte in MATCH corresponding to current group
    r1 = b[p5];         // r1 = spike detected so far.
    r1 = r1 | r0;       // OR it with what we got now
    p0 = r1;            
    b[p5] = r1;         // results represent spikes we got in the time of one packet.
    // Update the corresponding 7b-encoded area
    p3 = 32;
    p5 = p5 + p3;       // p5 points to corresponding byte in 7b area
    p1 = p1 + p0;       // offset to ENC_LUT using value of OR'd byte.
    r2 = b[p1];
    b[p5] = r2;         // write to 7b area.

    /* If we have finished going through all 32 groups, add the requested samples to
       radio packet.

       In the below code,
         FP_QS: how many samples have we written to the current packet - 6 max.
         FP_QPACKETS: number of queued packets, 0-15.
         FP_CHAN: current group of channel, 0-31.
    */
    r0 = 31; 
    // if current channel is 31, then 1 iter has finished, write a sample (1 per TXCHAN) to pkt
    cc = r6 == r0;
    if !cc jump end_txchan (bp);    // finish if not group31.
    /* Otherwise do the update.
       p0 and p5 are free to use.
       p3 points to SPI_TBDR -- need to be reset afterwards
       p2 read through WFBUF while sending pkt, p4 writing to buffer.
    */
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
    /* cur group is 31. 
       So i3 is @samp(t-15) of group0. Next iteration, samp(t-14) becomes the
       new samp(t-15). Therefore we increment i3 to point there.
    */
    i3 += 4;
    
    cc = r4 == r7;
    /* If we don't have 6 samples for TXCHANx yet in this pkt, then continue onto next iteration.
       Otherwise, we add templat matches to current pkt and finish constructing it.

       Each packet is 32-bytes. Each of the first 6 32-bit words contains a sample from each of 
       the TXCHANx, 1 byte per sample.

       The last 8 bytes of the packet contain template matches for 32 channels. Each byte is made
       from a corresponding byte from the 7b-match region, with its MSBit replaced by either a bit
       from the (packet # in frame flag), or a bit from the (echo field).

       The first 4 template match bytes in the packet receives the (packet # in frame) bits, which are
       derived from STATE_LUT.

       The second 4 template match bytes in the packet receives the echo bits, which is received from
       gtkclient's transmission.

       The raw samples are in lo-memory addr, the template matches are in higher-memory address within
       a packet.
    */
    if !cc jump end_txchan_qs (bp);
    r5 = [FP - FP_QPACKETS];
    p1 = r5;                       // Used to index to STATE_LUT, gives packe# in frame info
    p0 = [FP - FP_STATE_LUT_BASE];
    p5 = [FP - FP_MATCH_PTR7];     // p5 @ 7b-template match region, the template matches to read next.
    r5 += 1;                       // Finishing cur pkt, so one more on the queue.
    [FP - FP_QPACKETS] = r5;       // Update variable in memory
    p0 = (p0 + p1) << 2;           // 4-byte align, index into STATE_LUT
    r5 = [FP - FP_ECHO];           // echo flag in bits 31,23,15,7 of r5.
    r7 = [p0];                     // r7 contains packet# in frame
    
    r0 = [p5++];                   // r0 has the first 4 bytes of 7b-encoded template match.
    r1 = [p5++];                   // r1 has the second 4 bytes of 7b-encoded template match.
    r0 = r0 | r7;                  // Add in the packet# in frame bits to r0
    r1 = r1 | r5;                  // Add in the echo bits to r1
    
    // Make [FP_MATCH_PTR7] loop, reset the template matches.
    r7 = p5;                       
    p0 = -36;
    p5 = p5 + p0;                  // move p5 to 8b-region, corresponding to second 7b-byte from above.
    bitclr(r7,6);                   
    bitset(r7,5);
    [FP - FP_MATCH_PTR7] = r7;     // make sure [FP_MATCH_PTR7] stays in 7b-region and loops around.
    
    // Write template-match bytes to pkt
    [p4++] = r0;
    [p4++] = r1;
   
    r4 = 0; 
    // Reset the corresponding template-match bytes in 8bit region.
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
    
_clearirq_asm: //just write the status register via spi to clear radio's IRQ.
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

_waitirq_asm:   // wait for confirmation radio has sent the pkt.
	[--sp] = rets;
	r7 = 182; // should take max 360us = 178. min @ 1msps = 160
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
    r0 = 31(z); // need to account for the pipeline stuff...
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
    r0.l = LO(W1 + 1);   // ch0 amp or integrator output 
    r0.h = HI(W1 + 1);
    [FP - FP_TXCHAN0] = r0;
    // channel 32
    r0.l = LO(W1 + 2 + 1);   // ch32 amp or integrator output 
    r0.h = HI(W1 + 2 + 1);
    [FP - FP_TXCHAN1] = r0;
    // channel 64
    r0.l = LO(W1 + 14*4 + 0 + 1);   
    r0.h = HI(W1 + 14*4 + 0 + 1);
    [FP - FP_TXCHAN2] = r0;
    // channel 96
    r0.l = LO(W1 + 14*4 + 2 + 1);
    r0.h = HI(W1 + 14*4 + 2 + 1);
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
    p5 = 32+1 (x);
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
    p5 = (32+1)*W1_STRIDE*2;
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
    call wait_samples;
    
    r0 = REG1 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG2 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG3 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    //r0 = REG4 (z);
    r0 = REG4_DSP (z);  // this with DSP filter enabled
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = REG5 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = REG6 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = REG7 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG8 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG9 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG10 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = REG11 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = REG12 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG13 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG14 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG15 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = REG16 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = REG17 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

adc_calibration:    
    // send CALIB, then 9 dummy commands. Expect 10 words back
    r0 = CALIB (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = READ_42 (z);
    r0 = r0 << SHIFT_BITS;  // dummy1
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy2
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy3
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy4
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy 5
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy 6
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy 7
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy 8
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    // dummy 9
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

spell_intan:
    r0 = READ_40 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = READ_41 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = READ_42 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;

    r0 = READ_43 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;
    
    r0 = READ_44 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;  // call 0

    // Setup the pipeline for data acquisition..
    // r4 keeps track of the current channel, r0 is the command
    r4 = 0;
    r0 = r4 << 8;
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples; // call 1

    r4 += 1;
    r0 = r4 << 8;
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples;  // call 2 

    r4 += 1;
    r0 = r4 << 8;
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    call wait_samples; // call 3, now all setup stuff is out of pipeline and saved.
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
