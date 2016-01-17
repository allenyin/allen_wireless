#include <cdefBF532.h>
#include "headstage.h"
#include "nordic_regs.h"
#include "print.h"
#include "spi.h"
#include "usb.h"
#include "memory.h"

u32 g_excregs[8+6+16] ; //the regular data registers + pointer registers. 

void exception_report(unsigned long seqstat, unsigned long retx){
	//shift the bottom 5 bits out on portf 0 and 1 (1 = clock); 
	//radio may get a bit confused, but these are both inputs so it's ok
	unsigned long mask, out; 
	int i; 
	*pFIO_FLAG_D = 0; 
	printf_str("Exception!!"); 
	printf_hex("hwerr:", (seqstat >> 14) & 0x1f); 
	printf_hex("excause:", seqstat & 0x3f); 
	printf_hex("retx:", retx); 
	u32* p = g_excregs; 
	printf_hex("r0:", *p++); 
	printf_hex("r1:", *p++); 
	printf_hex("r2:", *p++); 
	printf_hex("r3:", *p++); 
	printf_hex("r4:", *p++); 
	printf_hex("r5:", *p++); 
	printf_hex("r6:", *p++); 
	printf_hex("r7:", *p++); 
	uart_str("\n"); 
	printf_hex("p0:", *p++); 
	printf_hex("p1:", *p++); 
	printf_hex("p2:", *p++); 
	printf_hex("p3:", *p++); 
	printf_hex("p4:", *p++); 
	printf_hex("p5:", *p++); 
	//loop registers. 
	uart_str("\n"); 
	printf_hex("i0:", *p++); 		
	printf_hex("b0:", *p++); 		
	printf_hex("l0:", *p++); 	
	uart_str("\n"); 
	printf_hex("i1:", *p++); 		
	printf_hex("b1:", *p++); 		
	printf_hex("l1:", *p++); 		
	uart_str("\n"); 
	printf_hex("i2:", *p++); 		
	printf_hex("b2:", *p++); 		
	printf_hex("l2:", *p++); 		
	uart_str("\n"); 
	printf_hex("i3:", *p++); 		
	printf_hex("b3:", *p++); 		
	printf_hex("l3:", *p++); 		
	uart_str("\n"); 
	printf_hex("m0:", *p++); 		
	printf_hex("m1:", *p++); 		
	printf_hex("m2:", *p++); 		
	printf_hex("m3:", *p++); 		
	while(1){
		//pulse pf 7 (MUX0) for trigger.
		*pFIO_FLAG_T = 0x100; 
		asm volatile("ssync"); 
		*pFIO_FLAG_T = 0x100; 
		asm volatile("ssync"); 
		
		mask = 0x20; 
		out = seqstat;
		for(i=0; i<6; i++){
			if(mask & out)
				*pFIO_FLAG_S = 1; 
			else
				*pFIO_FLAG_C = 1;
			*pFIO_FLAG_T = 2; 
			asm volatile("ssync"); 
			mask = mask >> 1; 
			*pFIO_FLAG_T = 2; 
			asm volatile("ssync"); 
		}
		*pFIO_FLAG_C = 1;
		// insert a pause. 
		for(i=0; i<30; i++){
			asm volatile("nop; nop;"); 
		}
		//only shift out the last 16 bits of retx - we know the top 16 bits. 
		mask = 0x8000; 
		out = retx;
		for(i=0; i<16; i++){
			if(mask & out)
				*pFIO_FLAG_S = 1; 
			else
				*pFIO_FLAG_C = 1;
			*pFIO_FLAG_T = 2; 
			asm volatile("ssync"); 
			mask = mask >> 1; 
			*pFIO_FLAG_T = 2; 
			asm volatile("ssync"); 
			//break into nibbles. (and format for the oscilloscope)
			if((i & 3) == 3){
				asm volatile("nop; nop; nop; nop; nop; nop; nop; nop;"); 
				asm volatile("nop; nop; nop; nop; nop; nop; nop; nop;"); 
				asm volatile("nop; nop; nop; nop; nop; nop; nop; nop;"); 
			}
		}
		*pFIO_FLAG_C = 1;
		// insert a pause. 
		for(i=0; i<300; i++){
			asm volatile("nop; nop;"); 
		}
	}
}

void nmi_report(void){
	int i; 
	printf_str("nonmaskable exception!"); 
	printf_str("this should not occur - hardware problems!"); 
	for(i=0; i<300; i++){
		asm volatile("nop; nop;"); 
	}
}

int main()
{
	u16 k; 
	
	//make sure cache is off.
	*pIMEM_CONTROL = 1;  
	asm volatile("csync"); 
    // DAG0 non-cacheable fetches use port A. Shouldn't really matter
	*pDMEM_CONTROL = 1; 
	asm volatile("csync"); 
	
	*pFIO_INEN = 0x8; // Enable PF3 as input - radio's _IRQ
	*pFIO_DIR = ~(*pFIO_INEN); // All other PF pins output
    // PF0=PF1=PF2=1: Nordic CE pin, Nordic CS deselect (active low), Flash CS deselect
	*pFIO_FLAG_D = 0x0187; 
	
	radio_init(84);      // radio channel, match with what gtkclient expects 
	*FIO_CLEAR = SPI_CE; // CE on radio 
	*FIO_CLEAR = 0x0080; //Clear PF3 - captured state from NRF-IRQ
	for(k=0; k<1000; k++){
		asm volatile("nop; nop; nop; nop;"); 	
	}
	
	radio_set_tx();
    // First disable all SPORT
    *pSPORT0_TCR1 = 0x0000;
    *pSPORT0_RCR1 = 0x0000;
    *pSPORT1_TCR1 = 0x0000;
    *pSPORT1_RCR1 = 0x0000;
    
    /* SCLK = 80MHz
     * TSCLKDIV = 1
     * TSCLK = SCLK / 2*(TSCLKDIV+1) = 80Mhz/4 = 20Mhz. Period = 50ns
     * TFS is active low
     * TFSDiv = 3 --> TFS is pulsed high for 3+1=4 cycles = 200ns. This
     *                seres as _CS for Intan (min=154ns).
     *
     * Receive serial clock RSCLK is connected to TSCLK - IRCLK=0
     * Receive frame sync RFS is externally generated through connection from
     * TFS - IRFS = 0
     *
     * Both Receive and Transmit use late-frame sync - LATFS = 1
     *
     * TCKFE = 1: Transmit drive data and internal frame-syncs with falling edge of TSCLK.
     * RCKFE = 1: Rising RSCLK/TSCLK edge to sample data and externally generated frame sync.
     */

    // Using TSCLK for late-frame-sync
    // SPORT0 transmit
    *pSPORT0_TCLKDIV = 1;
    *pSPORT0_TFSDIV = 3;
    *pSPORT0_TCR2 = TXSE | 0x10; // allow secondary; 

    // SPORT1 transmit
    *pSPORT1_TCLKDIV = 1;
    *pSPORT1_TFSDIV = 3;
    *pSPORT1_TCR2 = TXSE | 0x10; // allow secondary;

    // SPORT0 receive
    // Serial clock and frame syncs derived from TSCLK and TFS, so RCLKDIV and RFSDIV ignored.
    *pSPORT0_RCR2 = RXSE | 0x10; // allow secondary; 

    // SPORT1 receive
    // Serial clock and frame syncs derived from TSCLK and TFS, so RCLKDIV and RFSDIV ignored.
    *pSPORT1_RCR2 = RXSE | 0x10;

    /* Using RSCLK for late-frame-sync
    *pSPORT0_RCLKDIV = 1;
    *pSPORT0_RFSDIV = 4;
    *pSPORT0_RCR2 = RXSE | 0xf;

    *pSPORT1_RCLKDIV = 1;
    *pSPORT1_RFSDIV = 4;
    *pSPORT1_RCR2 = RXSE | 0xf;

    *pSPORT0_TCR2 = TXSE | 0xf;
    *pSPORT1_TCR2 = TXSE | 0xf;
    */

    // TSCLK for early-frame-sync
    /*
    *pSPORT0_TCLKDIV = 1;
    *pSPORT0_TFSDIV = 19;
    *pSPORT0_TCR2 = TXSE | 0xf;

    *pSPORT1_TCLKDIV = 1;
    *pSPORT1_TFSDIV = 19;
    *pSPORT1_TCR2 = TXSE | 0xf;

    *pSPORT0_RCR2 = RXSE | 0xf;
    *pSPORT1_RCR2 = RXSE | 0xf;
    */

    //---- block from Tim firmware-----
    //*pSPORT0_RCLKDIV = 1; //Determines the SCLK frequency and hence the data bit rate
	//*pSPORT0_RFSDIV = 19; //number of clock cycles -1 before generating TFS pulse. 
	//*pSPORT0_RCR2 = 0x010f; //16 bit word, secondary channel enabled, no stereo. 
	
	//*pSPORT1_RCLKDIV = 1; //Determines the SCLK frequency and hence the data bit rate
	//*pSPORT1_RFSDIV = 19; //number of clock cycles -1 before generating TFS pulse. 
	//*pSPORT1_RCR2 = 0x010f; //16 bit word, secondary channel enabled, no stereo. 
    //---- Tim block end -------------
    

    //------------ Testing Frame Syncs only ----------
    *pSPORT0_TCR1 = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK | DITFS;
    *pSPORT1_TCR1 = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK | DITFS;
    *pSPORT0_RCR1 = RCKFE | LARFS | LRFS | RFSR;
    *pSPORT1_RCR1 = RCKFE | LARFS | LRFS | RFSR;
    
    asm volatile("ssync;");
    /* 
    *pSPORT0_TCR1 = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK | TSPEN;// | DITFS;
    *pSPORT1_TCR1 = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK | TSPEN;// | DITFS;
    *pSPORT0_RCR1 = RCKFE | LARFS | LRFS | RFSR | RSPEN;
    *pSPORT1_RCR1 = RCKFE | LARFS | LRFS | RFSR | RSPEN;

    asm volatile("ssync;");
    */
    
    radio_bidi_asm(); //infinite loop! ends here!
    
    /*
    while (1) {
        asm volatile("nop;");
    }
    */
	return 0;
}
