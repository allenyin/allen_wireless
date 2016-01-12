#ifndef __MEMORY_H__
#define __MEMORY_H__

/* memory header file for radio_AGC+IIR.asm
   Signal-chain = integrator-highpass + AGC + IIR (2 biquads, LPF1 and HPF1)
   W1 stores original-samples, integrator mean, AGC gain, AGC-out, 3 pairs of delayed samples for biquads.
   A1 = the signal chain coef/param buffer, including integrator, AGC, and biquad coefficients.
*/

#define A1 				0xFF904000  /** BANK B **/ //i0 accesses.
#define A1_AGC			4			//units: end of AGC coefs is end of 4 32-bits words.
#define A1_LMS			0           // No LMS
#define A1_IIR		    8			// 4 coefs per biquad, 2 biquads.
#define A1_TEMPLATE	    0	
#define A1_APERTURE		0			// 4 16-bit words
#define A1_IIRSTARTA	(A1_AGC + A1_LMS)            //4 
#define A1_AGCB		(A1_IIRSTARTA + A1_IIR)          //12 
#define A1_IIRSTARTB	(A1_AGCB + A1_AGC + A1_LMS)  //16
#define A1_TEMPA		(A1_IIRSTARTB + A1_IIR)      //24
#define A1_APERTUREA	(A1_TEMPA + A1_TEMPLATE)     //24
#define A1_TEMPB		(A1_APERTUREA + A1_APERTURE) //24
#define A1_APERTUREB	(A1_TEMPB + A1_TEMPLATE)     //24
#define A1_STRIDE		(A1_APERTUREB + A1_APERTURE) //24 


#define FP_BASE			0xFF906F00 //length: 0x200, 512 bytes.
// ** Frame pointer counts down! **

#define TEMP_BUFFER 	0xFF906F00 //128 bytes = 0x80;
#define PRINTF_BUFFER_SIZE 128
#define PRINTF_BUFFER 	0xFF906F80 //same size, 128.
#define GCC_RESERVED 	0xFF907000 //above this GCC stomps around on.

#define W1 				0xFF804000  /** BANK A **/

/* 
  1 sample + 1 integrator mean + 1 AGC gain + 1 gained-sample + 
  IIR related: x0(n-1), x0(n-2), y1(n-1), y1(n-2), y2(n-1), y2(n-2)
  = 10 16-bit words per channel.
  10 32-bit words per 2 channels --> 20 32-bit words per group of 4.
*/
#define	W1_STRIDE		10

// T1, dont really care. Initiate as 0's and leave them
#define T1				0xFF805000  //accessed by i3, read/write delayed filtered signal
#define T1_LENGTH		(16*32*4)   // 16 delays, both templates matched to same delay,
									//32 channels, 4 bytes each ch.
									// 2048 = 0x800

// Also going to be 0's, not transmitting matching info
#define MATCH			0xFF806000 //256 bits, 128 channels * 2 templates.
#define MATCH_LENGTH	64         // 32 bytes. 8 words, TWICE -
							       //second half is 7-b encoded.

#define ENC_LUT			0xff806100 //256 bytes, map 8 bits -> 7 bits.
#define STATE_LUT		0xff806200 // 16 32bit words; length = 64 bytes.

#define WFBUF			0xFF807000  //really the transmit buffer.
#define WFBUF_LEN		1024		// length = 2 frames * 512 byte/frame; 512 bytes =  16-packet frames * (32bytes/pkt)

//use the frame pointer to store local variables for fast access.
#define FP_CHAN			4
#define FP_QS			8 //queue state -- how many samples have we written?
#define FP_QPACKETS		12
#define FP_ADDRESS		16  //for RX
#define FP_VALUE		20  //for RX
#define FP_TXCHAN3		24
#define FP_TXCHAN2		28
#define FP_TXCHAN1		32
#define FP_TXCHAN0		36
#define FP_TIMER		40
#define FP_WEIGHTDECAY	44
#define FP_8080			48
#define FP_5555			52
#define FP_AAAA			56
#define FP_SPORT0_RX	60
#define FP_SPI_TDBR		64
#define FP_FIO_FLAG_D	68
#define FP_MATCH_BASE	72 //= MATCH, defined above. write ptr= this + FP_CHAN
#define FP_MATCH_PTR7	76
#define FP_ENC_LUT_BASE	80
#define FP_STATE_LUT_BASE 84
#define FP_ECHO			88
#define FP_BLINK	    92

#ifndef LO
#define LO(con32) ((con32) & 0xFFFF)
#endif
#ifndef HI
#define HI(con32) (((con32) >> 16) & 0xFFFF)
#endif

#endif
