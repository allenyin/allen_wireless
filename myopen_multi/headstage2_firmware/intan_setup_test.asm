#include "spi.h"
#include "nordic_regs.h"

#define SHIFT_BITS 1
#define NEXT_CHANNEL 0x3f00
#define LED_BLINK 0x0010

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

/* Total space needed to hold responses (in 16-bit words) for each amp:
   2 for empty pipeline
   1 for repeat command 1
   18 for each write register command
   10 for (calibration + 9 dummy commands)
   5  for each READ intan commands

   36 16-bit words per amplifier -> 18 32-bit words per amplifier
   18*4 = 72 words total
*/

.global _radio_bidi_asm
_radio_bidi_asm:

    // p1 used to save values, increment when save values.
    p1.l = LO(FP_BASE); // FP_BASE at 0xFF906F00
    p1.h = HI(FP_BASE);
    r0 = 0 (z);
    p5 = 80;
    lsetup(lt_top, lt_bot) lc0 = p5; // write zeros to 80 locations
lt_top:
    [p1++] = r0;
lt_bot: nop;
    
    // reset p1 location
    p1.l = LO(FP_BASE);
    p1.h = HI(FP_BASE);

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

    p0.l = LO(SPORT0_RX);
    p0.h = HI(SPORT0_RX);

intan_setup:
    r0 = REG0 (z);
    r0 = r0 << SHIFT_BITS;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT0_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;

    // do it again, first transmit gets glitched usually...
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
    
    r0 = REG4 (z);
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
    call wait_samples;

    // 1 extra to send the last one in FIFO, 2 wait to empty pipeline.
    call wait_samples;
    call wait_samples;  
    call wait_samples;

we_finished:
    jump we_finished;
    //jump get_data_again;

wait_samples:
    r1 = w[p0 + (SPORT1_STAT - SPORT0_RX)];
    cc = bittst(r1, 0);
    if !cc jump wait_samples;
    
    // save new samples.
    r2 = [p0 + (SPORT1_RX - SPORT0_RX)];
    r3 = [p0 + (SPORT1_RX - SPORT0_RX)];
    r2 >>= SHIFT_BITS;
    r3 >>= SHIFT_BITS;
    w[p1++] = r2;
    w[p1++] = r3;

    r2 = [p0];
    r3 = [p0];
    r2 >>= SHIFT_BITS;
    r3 >>= SHIFT_BITS;
    w[p1++] = r2;
    w[p1++] = r3;
    rts;
