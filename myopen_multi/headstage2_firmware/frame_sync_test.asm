#include "spi.h"
#include "nordic_regs.h"

#define SHIFT_BITS 0
#define NEXT_CHANNEL 0x3f00
#define LED_BLINK 0x0010


.global _radio_bidi_asm
_radio_bidi_asm:

    p5.l = LO(SPORT0_TCR1); // SPORT0-TCR1
    p5.h = HI(SPORT0_TCR1);
    r0.l = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK | TSPEN;// | DITFS;
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

    r0 = 0 (z);
    w[p0] = r0;
    w[p0] = r0;
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;

    r0 = NEXT_CHANNEL (z);
    w[p0] = r0;
    w[p0] = r0;
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;

    w[p0] = r0;
    w[p0] = r0;
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r0;
    
    jump get_samples;

get_samples:
    r7 = NEXT_CHANNEL (z);

wait_samples:
    r3 = w[p0 + (SPORT1_STAT - SPORT0_RX)];
    cc = bittst(r3,0);
    if !cc jump wait_samples;

    // queue next channel in transmit FIFO. 
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 primary TX
    w[p0 + (SPORT0_TX - SPORT0_RX)] = r7;   // SPORT0 sec TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 primary TX
    w[p0 + (SPORT1_TX - SPORT0_RX)] = r7;   // SPORT1 sec TX
    
    // read out the samples in FIFO
    r1 = w[p0 + (SPORT1_RX - SPORT0_RX)];
    r0 = w[p0 + (SPORT1_RX - SPORT0_RX)];
    r1 = w[p0];
    r0 = w[p0];
    jump wait_samples;
