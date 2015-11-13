#include "spi.h"
#include "nordic_regs.h"

#define SHIFT_BITS 1
#define NEXT_CHANNEL 0x3f00
#define LED_BLINK 0x0010
#define READ_40 0xe800  // result should be 8 0's, then 01001001
#define READ_41 0xe900  // sending 11_101001_00000000, get 00000000_01001110
#define READ_42 0xea00  // sending 11_101010_00000000, get 00000000_01010100
#define READ_43 0xeb00  // sending 11_101011_00000000, get 00000000_01000001
#define READ_44 0xec00  // result should be 8 0's, then 01001110


.global _radio_bidi_asm
_radio_bidi_asm:

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

    r0 = READ_42 (z);
    r0 = r0 << SHIFT_BITS;
    [p0] = r0;
    [p0] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;

    r0 = READ_43 (z);
    r0 = r0 << SHIFT_BITS;
    [p0] = r0;
    [p0] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    [p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    
    jump get_samples;

get_samples:
    r0 = READ_43 (z);
    r1 = 0x100 (z);

wait_samples:
    r2 = w[p0 + (SPORT1_STAT - SPORT0_RX)];
    cc = bittst(r2,0);
    if !cc jump wait_samples;

    r0 = r0 ^ r1;   // toggle between READ_42 and READ_43
    r3 = r0 << SHIFT_BITS;

    // queue next channel in transmit FIFO. 
    [p0 + (SPORT0_TX - SPORT0_RX)] = r3;   // SPORT0 primary TX
    [p0 + (SPORT0_TX - SPORT0_RX)] = r3;   // SPORT0 sec TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r3;   // SPORT1 primary TX
    [p0 + (SPORT1_TX - SPORT0_RX)] = r3;   // SPORT1 sec TX
    
    // read out the samples in FIFO
    r4 = [p0 + (SPORT1_RX - SPORT0_RX)];
    r5 = [p0 + (SPORT1_RX - SPORT0_RX)];
    r4 = [p0];
    r5 = [p0];
    jump wait_samples;
