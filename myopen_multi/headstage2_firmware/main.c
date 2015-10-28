#include <cdefBF532.h>
#include "memory.h"
#include "headstage.h"
#include "nordic_regs.h"
#include "print.h"
#include "spi.h"
#include "usb.h"

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
	
	radio_init(124);  //channel seems to make no difference. used to be 124.
	*FIO_CLEAR = SPI_CE; // CE on radio 
	*FIO_CLEAR = 0x0080; //Clear PF3 - captured state from NRF-IRQ
	for(k=0; k<1000; k++){
		asm volatile("nop; nop; nop; nop;"); 	
	}
	
	radio_set_tx();
    
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

    // SPORT0 transmit
    *pSPORT0_TCLKDIV = 1;
    *pSPORT0_TFSDIV = 3;
    *pSPORT0_TCR1 = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK; // SPORT0 transmit not yet enabled
    *pSPORT0_TCR2 = TXSE | 0xf; // allow secondary; 0xf=15 -> transmit word length=15+1=16 bits; 

    // SPORT1 transmit
    *pSPORT1_TCLKDIV = 1;
    *pSPORT1_TFSDIV = 3;
    *pSPORT1_TCR1 = TCKFE | LATFS | LTFS | TFSR | ITFS | ITCLK; // SPORT1 transmit not yet enabled
    *pSPORT1_TCR2 = TXSE | 0xf; // allow secondary; 0xf=15 -> transmit word length=15+1=16 bits

    // SPORT0 receive
    // Serial clock and frame syncs derived from TSCLK and TFS, so RCLKDIV and RFSDIV ignored.
    *pSPORT0_RCR1 = RCKFE | LATFS | LRFS | RFSR;
    *pSPORT0_RCR2 = RXSE | 0xf; // allow secondary; 0xf=15 -> receive word length=15+1=16 bits

    // SPORT1 receive
    // Serial clock and frame syncs derived from TSCLK and TFS, so RCLKDIV and RFSDIV ignored.
    *pSPORT1_RCR1 = RCKFE | LATFS | LRFS | RFSR;
    *pSPORT1_RCR2 = RXSE | 0xf;

    asm volatile("ssync;");
	
    radio_bidi_asm(); //infinite loop! ends here!
	return 0;
}
