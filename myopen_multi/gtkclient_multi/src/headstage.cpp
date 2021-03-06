// moving the headstage control functions into a new file.
// main file was getting to big!

//channel.h pulls in many headers -- inluding the opengl/cg ones.
#define GL_GLEXT_PROTOTYPES
#include <gtk/gtk.h>
#include <gtk/gtkgl.h>
#include <GL/glut.h>    // Header File For The GLUT Library
#include <GL/gl.h>	// Header File For The OpenGL32 Library
#include <GL/glu.h>	// Header File For The GLu32 Library
#include <GL/glx.h>     // Header file for the glx libraries.

#include <Cg/cg.h>    /* included in Cg toolkit for nvidia */
#include <Cg/cgGL.h>

#include <stdio.h>
#include <sys/types.h>
#include <inttypes.h>
#include <sys/time.h>
#include <pthread.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <memory.h>
#include <math.h>
#include <arpa/inet.h>
#include <boost/multi_array.hpp>
#include <map>
#include <string>
#include <iostream>

#include "gettime.h"
#include "sock.h"
#include "headstage.h"
//#include "../firmware_stage9_tmpl/memory.h"
#ifdef HEADSTAGE_TIM
    #include "../headstage_firmware/memory.h"
#else
    #include "../headstage2_firmware/memory.h"
#endif



Headstage::Headstage(){
  
  for(int t = 0; t < NSCALE; t++){
	//populate the variables
	m_sendL[t] = 0x4000;
	m_sendbuf[t] = (unsigned int*)malloc(m_sendL[t]*32);
	if(!m_sendbuf[t]){
		fprintf(stderr, "could not allocate m_sendbuf\n");
	}
	m_sendR[t] = 0;
	m_sendW[t] = 0;
	}
}

Headstage::Headstage(int *g_channel,  const std::vector<Channel*> &g_c){
// for 31.25ksps -- see filter_butter.m
// broken into 2 biquads, order b0 b1 a0 a1
  
  m_c = g_c; //shallow copy because the containers are pointers
  m_channel = g_channel;
  
  for(int t = 0; t < NSCALE; t++){
	//populate the variables
	m_sendL[t] = 0x4000;
	m_sendbuf[t] = (unsigned int*)malloc(m_sendL[t]*32);
	if(!m_sendbuf[t]){
		fprintf(stderr, "could not allocate m_sendbuf\n");
	}
	m_sendR[t] = 0;
	m_sendW[t] = 0;
	}
  
  
}
unsigned int Headstage::echoHeadstage(unsigned int echoID, unsigned int address){
	address &= m_echoMask;
	address |= (echoID & 0xf) << 28; //top nibble is f normally.
	return address;
}
unsigned int Headstage::getOldHeadecho(int thread){ return m_oldheadecho[thread]; }
void Headstage::setOldHeadecho(int thread){ m_oldheadecho[thread] = m_headecho[thread]; }
unsigned int Headstage::getHeadecho(int thread){ return m_headecho[thread]; }
unsigned int Headstage::getEcho(int thread){ return m_echo[thread]; }

unsigned int* Headstage::getSendbuf (int thread){ return m_sendbuf[thread]; }

i64 Headstage::getMessW (int thread){ return m_messW[thread]; }
i64 Headstage::getMessR (int thread){ return m_messR[thread]; }
char* Headstage::getMessages (int thread, int index){ return m_messages[thread][index]; }

i64 Headstage::getSendW (int thread){ return m_sendW[thread]; }
i64 Headstage::getSendR (int thread){ return m_sendR[thread]; }
i64 Headstage::getSendL (int thread){ return m_sendL[thread]; }


void Headstage::incrMessR(int thread){ m_messR[thread]++;}
void Headstage::incrSendR(int thread){ m_sendR[thread]++;}
void Headstage::freeSendbuf(int thread) { free(m_sendbuf[thread]);}

void Headstage::saveMessage(const char *fmt, ...){
	va_list ap;     /* our argument pointer */
    if (fmt == NULL)    /* if there is no string to draw do nothing */
        return;
    va_start(ap, fmt);  //make ap point to first unnamed arg
	//need to add in 'echo' in alphabet encoding - when the headstage has the same sync,
	//we know that it got the command preceding this.
	
	for(int tid = 0; tid < NSCALE; tid++){
			int e = m_echo[tid] % 16;
			m_messages[tid][m_messW[tid] % 1024][0] = 'A'+e;
			m_messages[tid][m_messW[tid] % 1024][1] = ' ';
			vsnprintf(m_messages[tid][m_messW[tid] % 1024] + 2, 126, fmt, ap);
			va_end(ap);
			m_messW[tid]++;
	}
}

void Headstage::saveMessage(int tid, const char *fmt, ...){
	va_list ap;     /* our argument pointer */
    if (fmt == NULL)    /* if there is no string to draw do nothing */
        return;
    va_start(ap, fmt);  //make ap point to first unnamed arg
	//need to add in 'echo' in alphabet encoding - when the headstage has the same sync,
	//we know that it got the command preceding this.
	
	int e = m_echo[tid] % 16;
	m_messages[tid][m_messW[tid] % 1024][0] = 'A'+e;
	m_messages[tid][m_messW[tid] % 1024][1] = ' ';
	vsnprintf(m_messages[tid][m_messW[tid] % 1024] + 2, 126, fmt, ap);
	va_end(ap);
	m_messW[tid]++;
}

#if defined(HEADSTAGE_TIM) || defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
void Headstage::updateIIRGain(int chan){
	/* remember, channels 0 and 32 are filtered at the same time.
		then 64 and 96
		and the biquads are arranged as:
		low1 high1 low2 high2
		only can adjust the B coefs of the lowpass filters, though.
		(the highpass coefs are maxed out)
		all emitted numbers are base 14.(s2rnd flag)

        For RHD headstages, the biquads are arranged as
        low1, high1
	*/

	//thread handles channels in multiples of 128. If 
	int tid = chan/128; //0 if lower than 128, etc. This should update to the pertinent thread index in the i64 buffers
	chan = chan & ( (128*(tid+1)-1) ^ 32); //the above mapping was not working for anything > 256
	
    float again1, again2; //the actual gains.
#ifdef HEADSTAGE_TIM
    float gain1 = sqrt(fabs(m_c[chan]->getGain()));
	float gain2 = sqrt(fabs(m_c[chan+32]->getGain()));
	int indx [] = {0,1,4,5}; // index the B coefs.
    int nCoefs = 4;          // 4 B coefs total
#elif defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
    float gain1 = fabs(m_c[chan]->getGain());
    float gain2 = fabs(m_c[chan+32]->getGain());
    int indx [] = {0,1};     // index the B coefs
    int nCoefs = 2;          // 2 B coefs total
#endif
    float b[2*nCoefs];      // nCoefs for each channel, we update two chs at the same time
	int i,j,k;
	unsigned int u;
	
	for(i=0; i<nCoefs; i++){
		j = indx[i];
		b[i*2+0] = m_lowpass_coefs[j]*gain1*16384.f;
		b[i*2+1] = m_lowpass_coefs[j]*gain2*16384.f;
	}
	//clamp to acceptable values.
	for(i=0; i<nCoefs*2; i++){
		b[i] = b[i] < -32768.f ? -32768.f : b[i];
		b[i] = b[i] > 32767.f ? 32767.f : b[i];
	}
	if(m_c[chan]->getGain() < 0){
		b[0] *= -1; 
        b[2] *= -1; //change the sign of the first filter.
	}
	if(m_c[chan+32]->getGain() < 0){
		b[1] *= -1; 
        b[3] *= -1;
	}
	
    //calculate the actual gain. assume static gain = 1
#ifdef HEADSTAGE_TIM
	again1 =
		((b[0]/(m_lowpass_coefs[0]*16384.f) +
			b[2]/(m_lowpass_coefs[1]*16384.f))/2.f) *
		((b[4]/(m_lowpass_coefs[4]*16384.f) +
			b[6]/(m_lowpass_coefs[5]*16384.f))/2.f);
	again2 =
		((b[1]/(m_lowpass_coefs[0]*16384.f) +
			b[3]/(m_lowpass_coefs[1]*16384.f))/2.f) *
		((b[5]/(m_lowpass_coefs[4]*16384.f) +
			b[7]/(m_lowpass_coefs[5]*16384.f))/2.f);
#elif defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
    again1 =
		((b[0]/(m_lowpass_coefs[0]*16384.f) +
			b[2]/(m_lowpass_coefs[1]*16384.f))/2.f);
	again2 =
		((b[1]/(m_lowpass_coefs[0]*16384.f) +
			b[3]/(m_lowpass_coefs[1]*16384.f))/2.f);
#endif

	printf("actual gain ch %d %f ; ch %d %f\n",
		   chan, again1, chan+32, again2);
	//now form the 4x 32 bit uints to be written.
#ifdef HEADSTAGE_TIM
	int indx2[] = {0,1,8,9}; //don't write highpass Bs (4,5,12,13)
#elif defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
    int indx2[] = {0, 1};
#endif
	
	unsigned int* ptr = m_sendbuf[tid];
	ptr += (m_sendW[tid] % m_sendL[tid]) * 8; //8 because we send 8 32-bit ints /pkt.
	
	int kchan = chan & 127; //(to send in buf, needs to keep correct channel name) (0-127)
	//use kchan when not indexing m_c, thus, bitwise AND for 127 maps channels > 128 to 0-127.
	for(i=0; i<nCoefs; i++){
		//remember, chan mapped to 0-31 & 64-95 (above)
		unsigned int p = 0;
		if(kchan >= 64) p += 1; //chs 64-127 pocessed following 0-63, or 192-255 following 128 to 191
		ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], A1 +
			(A1_STRIDE*(kchan & 31) +
			A1_IIRSTARTA + p*(A1_IIRSTARTB-A1_IIRSTARTA) + indx2[i])*4));

		j = (int)(b[i*2+0]);
		k = (int)(b[i*2+1]);
		u = (unsigned int)((j&0xffff) | ((k&0xffff)<<16));
		ptr[i*2+1] = htonl(u);
	}
	m_sendW[tid]++;
	saveMessage(tid, "gain %d %3.2f %d %3.2f thread %d", chan, again1, chan+32, again2, tid);
	m_echo[tid]++;
}
#endif

#ifdef RADIO_GAIN_IIR_SAA
// Method to convert Q7.8 gain values to binary. 
// Not a class method
unsigned int binaryGain(float gain) {
    double fractpart, intpart;

    unsigned int int2bin, fract2bin;

    if (gain < 0) {
        float pos_mag = 128 + gain;
        fractpart = modf(pos_mag, &intpart);
        int2bin = (unsigned int)(intpart + 128);
    }
    else {
        fractpart = modf(gain, &intpart);
        int2bin = (unsigned int) intpart;
    }

    fract2bin = 0;                              // the integer rep of the binary sequence of the fract part
    switch((int)(fractpart/0.1 + 0.5f)) {       // add the 0.5f to make sure it rounds to nearest integer,
        case 1:                                 // otherwise C/C++ rounds toward 0 by default.
            fract2bin = 25; break;
        case 2:
            fract2bin = 51; break;
        case 3:
            fract2bin = 76; break;
        case 4:
            fract2bin = 102; break;
        case 5:
            fract2bin = 128; break;
        case 6:
            fract2bin = 153; break;
        case 7:
            fract2bin = 179; break;
        case 8:
            fract2bin = 204; break;
        case 9:
            fract2bin = 230; break;
    }
    
//    cout << "gain=" << gain << endl;
//    cout << "intpart=" << intpart << " converts into " << (int2bin << 8) << endl;
//    cout << "fractpart=" << fractpart << " converts into " << fract2bin << endl;
    return (int2bin << 8) + fract2bin;
}

void Headstage::updatePreGain(int chan) {
    int tid = chan/128;
    chan = chan & ( (128*(tid+1)-1) ^ 32);
    unsigned int p = 0;
    int kchan = chan & 127;
    if (kchan >= 64) p += 1;

    // Slot means whether the chan occupies the lower or higher 16-bit in memory
    int slot = 0;
    if ((kchan&32) > 0) slot = 1;   // our channel is in uppery 16-bit

    // gain should always be positive
    // if slot>1, then gain2 is lower address
    float gain1 = m_c[chan]->getGain();
    float gain2 = (slot>0)? m_c[chan-32]->getGain() : m_c[chan+32]->getGain();

    /* Each command packet has 4 address-value pairs. Since we are setting the pre-gain for
     * just one channel, the packet will contain 4 identical address-value pairs.
     *
     * But first, we need to conver the float gain into correct Q7.8 binary values.
     */
    unsigned int gain_bin1 = binaryGain(gain1);
    unsigned int gain_bin2 = binaryGain(gain2);

    // now we construct the packet
    unsigned int * ptr = m_sendbuf[tid];
    ptr += (m_sendW[tid] % m_sendL[tid]) * 8;

    // we use the address of the lower channel in the slot
    int kchan_new = slot > 0 ? kchan-32 : kchan;
    for (int i=0; i<4; i++) {
        // first the address, use kchan_new
        ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], A1 + 
                    (A1_STRIDE*(kchan_new & 31) + p*(A1_IIRSTARTA+A1_IIR))*4));
        unsigned int u = slot > 0 ? ((gain_bin2 & 0xffff) | ((gain_bin1 & 0xffff)<<16)) :
                                    ((gain_bin1 & 0xffff) | ((gain_bin2 & 0xffff)<<16));
        ptr[i*2+1] = htonl(u);
    }
    m_sendW[tid]++;
    saveMessage(tid, "preGain %d %3.2f %d %3.2f thread %d", chan, gain1, slot>0?chan-32:chan+32, gain2, tid);
    m_echo[tid]++;
}
#endif

void Headstage::setOsc(int chan){
	//turn two channels e.g. 0 and 32 into oscillators.
	float b[4];
	unsigned int u;
	int i,j;
	int tid = chan/128;
	//(to send, needs to keep correct channel name)
	b[0] = 0.f; //assume there is already energy in the
	b[1] = 0.f; //delay line.
#if defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_GAIN_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
	b[2] = 32768.f - 573; //10 -> should be about 919Hz @ fs = 31250Hz
    printf("Here we have special coef\n");
#elif defined(HEADSTAGE_TIM)
    printf("Setting 250Hz osc\n");
    b[2] = 32768.f - 45; // Should be about 250Hz @ fs = 31250Hz
#endif
	b[3] = -16384.f;
	
	unsigned int* ptr = m_sendbuf[tid];
	ptr += (m_sendW[tid] % m_sendL[tid]) * 8; //8 because we send 8 32-bit ints /pkt.
	
	//chan = chan & (0xff ^ 32); //map to the lower channels.
		// e.g. 42 -> 10,42; 67 -> 67,99 ; 100 -> 68,100
	chan = chan & ( (128*(tid+1)-1) ^ 32); //the above mapping was not working for anything > 256
		
	int kchan = chan & 127; 
	
	for(i=0; i<4; i++){
		
			unsigned int p = 0;
			if(kchan >= 64) p += 1; //chs 64-127 pocessed following 0-63.
			ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], A1 +
				(A1_STRIDE*(kchan & 31) +
				A1_IIRSTARTA + p*(A1_IIRSTARTB-A1_IIRSTARTA) + i)*4));
			j = (int)(b[i]);
			u = (unsigned int)((j&0xffff) | ((j&0xffff)<<16));
			ptr[i*2+1] = htonl(u);
            printf("Address %#010x = %#010x\n", 
                (A1 + (A1_STRIDE*(kchan & 31) + A1_IIRSTARTA + p*(A1_IIRSTARTB-A1_IIRSTARTA) + i)*4),
                u);
	}
	m_sendW[tid]++;
	saveMessage(tid, "osc %d and %d thread %d", chan, chan+32, tid);
	m_echo[tid]++;
}

void Headstage::setChans(int signalChain){
    // Tell headstage to transmit the specified stage of the signalChain.
	int i;

	for(i=0; i<4;i++){
		int c = m_channel[i];
		int tid = c/128;
		unsigned int* ptr = m_sendbuf[tid];
		ptr += (m_sendW[tid] % m_sendL[tid]) * 8; //8 because we send 8 32-bit ints /pkt.
		//scope these here (could also make a thread safe ptr array?)
		ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], (FP_BASE - FP_TXCHAN0 + 4*i)));
        
        /* Calculate headstage memory address corresponding to signal-chain value
           
           The calculation is the same regardless what the signal chain is in the
           firmware, as long as W1_STRIDE is set correctly.The signalNames need
           to be editted in gtkclient.cpp according to what signal-chain stages are
           actually present.
        */
		int o1 = (c & 31) * W1_STRIDE * 2 * 4; //which MUX line.
		int o2 = ((c & 64)>>6) * W1_STRIDE * 4; // primary/secondary SPORT
		int o3 = ((c & 32)>>5) * 2; // primary/secondary RX chan.
		
        /* 4th offset is to get to the correct written delay.
            Tim's signal chain   | Allen's signal chain
		0	mean from integrator |  original sample   <--- radio_basic end
		1	gain                 |  integrated mean
		2	saturated sample     |  AGC-gain
		3	AGC out / LMS save   |  AGC-output        <--- radio_agc end
		4	x1(n-1) / LMS out    |  x1(n-1)/AGC-out
		5	x1(n-2)              |  x1(n-2)
		6	x2(n-1) / y1(n-1)    |  y1(n-1)
		7	x2(n-2) / y1(n-2)    |  y1(n-2)
		8	x3(n-1) / y2(n-1)    |  y2(n-1)/final out
		9	x3(n-2) / y2(n-2)    |  y2(n-2)           <--- radio_agc_iir/radio_agc_iir_saa end
		10	x2(n-1) / y3(n-1)
		11	x2(n-2) / y3(n-2)
		12	y4(n-1)
		13	y4(n-2)
		 */

		int o4 = signalChain * 4;
		ptr[i*2+1] = htonl(W1 + o1 + o2 + o3 + o4 + 1); //1 is for little-endian.
        printf("setChans: new value is 0x%x\n", W1+o1+o2+o3+o4+1);
	}
	for(i=0; i<4; i++){
		saveMessage("chan %c %d", 'A'+i, m_channel[i]);
		printf("chan %c %d", 'A'+i, m_channel[i]);
		//save it in the sqlite db.
		//sqliteSetValue(i,"channel", (float)m_channel[i]);
	}
	for(int tid = 0; tid < NSCALE; tid++){
			m_sendW[tid]++;
			m_echo[tid]++;
	}
	
}
void Headstage::setAGC(int ch1, int ch2, int ch3, int ch4){
	//sets AGC for (up to) four channels.
	
	//hardcoded channel limits? -_- I'll take care of the limiting elsewhere
	int chs[4]; 
	chs[0] = ch1; chs[1]= ch2;
		chs[2] = ch3; chs[3] = ch4;
		
	for(int i=0; i<4; i++){
		
		int chan = chs[i];
		int tid = chan/128;
		
		//scope these variables here, otherwise it's a pain
		unsigned int* ptr = m_sendbuf[tid];
		ptr += (m_sendW[tid] % m_sendL[tid]) * 8; //8 because we send 8 32-bit ints /pkt.
	
		chan = chan & ( (128*(tid+1)-1) ^ 32); //the above mapping was not working for anything > 256
		unsigned int p = 0;
		
		int kchan = chan &127; //(to send, needs to keep correct channel name)
		if(kchan >= 64) p += 1; //chs 64-127 pocessed following 0-63.
		
        ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], A1 +
			(A1_STRIDE*(kchan & 31) +
			p*(A1_IIRSTARTA+A1_IIR) + 2)*4)); // 2 is the offset to the AGC target.
		
		int j = (int)(sqrt(32768 * m_c[chan]->getAGC()));       // update our AGC target
		int k = (int)(sqrt(32768 * m_c[chan+32]->getAGC()));    // also it's neighboring, b/c why not?
        //printf("j=%u, k=%u\n", (unsigned int)j, (unsigned int)k);
		unsigned int u = (unsigned int)((j&0xffff) | ((k&0xffff)<<16));
		ptr[i*2+1] = htonl(u);
	}
	
	for(int tid = 0; tid < NSCALE; tid++){
			m_sendW[tid]++;
			m_echo[tid]++;
	}
	
	saveMessage("agc %d %d %d %d : %d %d %d %d ", ch1,ch2,ch3,ch4,
		(int)m_c[ch1]->getAGC(),(int)m_c[ch2]->getAGC(),(int)m_c[ch3]->getAGC(),(int)m_c[ch4]->getAGC());
}
/*void enableAGC(int* chs, int en){
	// you must enable / disable chs 0 and 32 at the same time.
	// this routine accepts 4 chs -- and sets the complement within the bank at the same time.
	// 8 channels altogether -- so for all, need to call 16 times.
	unsigned int* ptr = m_sendbuf[[tid];
	ptr += (m_sendW[tid] % m_sendL[[tid]) * 8; //8 because we send 8 32-bit ints /pkt.
	
	for(int i=0; i<4; i++){
		int chan = chs[i];
		//m_c[chan]->getAGC() = target; set ACG elsewhere.
		chan = chan & (0xff ^ 32); //map to the lower channels (0-31,64-95)
		unsigned int p = 0;
		if(chan >= 64) p += 1; //chs 64-127 pocessed following 0-63.
		ptr[i*2+0] = htonl(echoHeadstage(A1 +
			(A1_STRIDE*(chan & 31) + p*A1_AGCB + 3)*4)); // 3 is the offset to the AGC target.
		int j = 16384;
		int k = en > 0 ? 1 : 0;
		unsigned int u = (unsigned int)((j&0xffff) | ((k&0xffff)<<16));
		ptr[i*2+1] = htonl(u);
	}
	m_sendW[tid]++;
	saveMessage("agc()_en %d %d %d %d : %d", chs[0], chs[1], chs[2], chs[3], en);
	m_echo[tid]++;
}*/
void Headstage::setAperture(int ch){
	// aperture order: ch0, ch32, ch64, ch96. (little-endian)
	// each 16 bits.
	//might as well set both A & B apertures in same packet.
	int tid = ch/128;
	
	ch &= 31;
	unsigned int* ptr = m_sendbuf[tid];
	ptr += (m_sendW[tid] % m_sendL[tid]) * 8;
	
	for(int i=0; i<4; i++){
		ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], A1 +
			(A1_STRIDE*ch + (A1_TEMPLATE+A1_APERTURE)*(i/2) +
			 A1_APERTUREA + (i&1))*4));
		unsigned int u = (m_c[ch+64*(i&1)+128*tid]->getAperture(i/2) & 0xffff) |
						    ((m_c[ch+32+64*(i&1)+128*tid]->getAperture(i/2) & 0xffff)<<16);
		ptr[i*2+1] = htonl(u);
	}
	m_sendW[tid]++;
	
	for(int i=0; i<4; i++){
		saveMessage(tid, "aperture %d %d,%d", ch + 32*i,
				m_c[ch + 32*i + 128*tid]->getAperture(0),
				m_c[ch + 32*i + 128*tid]->getAperture(0));
	}
	m_echo[tid]++;
}
void Headstage::setLMS(bool on){
	//this applies to all channels.
	for(int tid = 0; tid < NSCALE; tid++)
	{
		unsigned int* ptr = m_sendbuf[tid];
		ptr += (m_sendW[tid] % m_sendL[tid]) * 8; //8 because we send 8 32-bit ints /pkt. (32 byte packets)
		
		for(int i=0; i<4; i++){
			ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], FP_BASE - FP_WEIGHTDECAY)); //frame pointer
			ptr[i*2+1] = htonl(on ? 0x7fff0005 : 0); //see r4 >>> 1 (v) in radio4.asm
		}
		m_sendW[tid]++;
		m_echo[tid]++;
	}
	saveMessage("lms %d", (on ? 1 : 0));
    printf("lms %d\n", (on ? 1 : 0));
}
void Headstage::setTemplate(int ch, int aB){
	
	int tid = ch/128;
	
	ch &= 31;
	aB &= 1;
	//each template is 16 points; can write 4 at a time, so need 4 writes.
	//template range: [-0.5 .. 0.5]
	
	for(int p=0; p<4; p++){
		unsigned int* ptr = m_sendbuf[tid];
		ptr += (m_sendW[tid] % m_sendL[tid]) * 8;
		
		for(int i=0; i<4; i++){
			//template A starts with newest sample (rightmost) -- loop.
			//template B is in normal order. (oldest first)
			int n = (p*4+i+(1-aB)*15)%16;
			ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], A1 +
				(A1_STRIDE*ch + (A1_TEMPLATE+A1_APERTURE)*aB +
				A1_TEMPA + (p*4+i))*4));
			unsigned char a,b,c,d;
			a = (unsigned char)round((m_c[ch +  0 + 128*tid]->getTemplate(aB,n)+0.5f) * 255.f);
			b = (unsigned char)round((m_c[ch + 32 + 128*tid]->getTemplate(aB,n)+0.5f) * 255.f);
			c = (unsigned char)round((m_c[ch + 64 + 128*tid]->getTemplate(aB,n)+0.5f) * 255.f);
			d = (unsigned char)round((m_c[ch + 96 + 128*tid]->getTemplate(aB,n)+0.5f) * 255.f);
			unsigned int u = ((a << 0) & 0xff) |  //gcc will optimize this sillyness.
							((b << 8) & 0xff00) |     //I hate you so much Tim.
							((c <<16) & 0xff0000) |
							((d <<24) & 0xff000000);
			ptr[i*2+1] = htonl(u);
		}
		m_sendW[tid]++;
		m_echo[tid]++;
	}
	//really should save the templates somewhere else (another file)
}

void Headstage::setBiquad(int chan, float* biquad, int biquadNum){
	// biquad num 0 or 1
	// biquad lo or hi (global)
	
	int tid = chan/128; //which thread id does the channel belong to
	
	//chan = chan & (0xff ^ 32); //map to the lower channels (0-31,64-95)
	chan = chan & ( (128*(tid+1)-1) ^ 32); //the above mapping was not working for anything > 256
	
	float gain1 = sqrt(fabs(m_c[chan]->getGain()));
	float gain2 = sqrt(fabs(m_c[chan+32]->getGain()));
	float b[8];
	int i,j,k;
	short s;
	unsigned int u;
	if(biquadNum & 1){
		gain1 = gain2 = 1.f; //no gain on the hpf.
	}
	for(i=0; i<2; i++){
		b[i*2+0] = biquad[i]*gain1*16384.f; //B coefs
		b[i*2+1] = biquad[i]*gain2*16384.f; //lo and hi, respectively
	}
	for(i=2; i<4; i++){
		b[i*2+0] = biquad[i]*16384.f;
		b[i*2+1] = biquad[i]*16384.f;
	}
	//clamp to acceptable values.
	printf("coefs!\n");
	for(i=0; i<8; i++){
		b[i] = b[i] < -32768.f ? -32768.f : b[i];
		b[i] = b[i] > 32767.f ? 32767.f : b[i];
		//printf("%d %f\n", i, b[i]);
	}
	if(biquadNum == 0){
		if(m_c[chan]->getGain() < 0){
			b[0] *= -1; b[2] *= -1; //change the sign of the first filter.
		}
		if(m_c[chan+32]->getGain() < 0){
			b[1] *= -1; b[3] *= -1;
		}
	}
	//now form the 32 bit uints to be written.
	unsigned int* ptr = m_sendbuf[tid];
	ptr += (m_sendW[tid] % m_sendL[tid]) * 8; //8 because we send 8 32-bit ints /pkt.
	
	int kchan = chan&127;
	for(i=0; i<4; i++){
		unsigned int p = 0;
		if(kchan >= 64) p += 1; //chs 64-127 pocessed following 0-63.
		ptr[i*2+0] = htonl(echoHeadstage(m_echo[tid], A1 + ((kchan & 31)*A1_STRIDE +
			 A1_IIRSTARTA + p*(A1_IIRSTARTB-A1_IIRSTARTA) + biquadNum*4 + i)*4));
		j = (int)(b[i*2+0]);
		k = (int)(b[i*2+1]);
		u = (unsigned int)((j&0xffff) | ((k&0xffff)<<16));
		s = (short)(u & 0xffff);
		printf("%d ", s);
		s = (short)((u>>16) & 0xffff);
		printf("%d\n", s);
		ptr[i*2+1] = htonl(u);
	}
	saveMessage(tid, "biquad %d ch %d: %d %d %d %d",
				biquadNum, chan,(int)b[0],(int)b[2],(int)b[4],(int)b[6]);
	saveMessage(tid, "biquad %d ch %d: %d %d %d %d",
				biquadNum, chan+32,(int)b[1],(int)b[3],(int)b[5],(int)b[7]);
	m_sendW[tid]++;
	m_echo[tid]++;
}
void Headstage::resetBiquads(int chan){
#if defined(HEADSTAGE_TIM) || defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_GAIN_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
	//reset all coefs in two channels.
	setBiquad(chan, &(m_lowpass_coefs[0]), 0);
	setBiquad(chan, &(m_highpass_coefs[0]), 1);
#endif

#ifdef HEADSTAGE_TIM
	setBiquad(chan, &(m_lowpass_coefs[4]), 2);
	setBiquad(chan, &(m_highpass_coefs[4]), 3);
#endif
}

#ifdef HEADSTAGE_TIM
void Headstage::setFilter2(int chan){
	//reset all coefs in two channels.
	setBiquad(chan, &(m_lowpass_coefs2[0]), 0);
	setBiquad(chan, &(m_highpass_coefs2[0]), 1);
	setBiquad(chan, &(m_lowpass_coefs2[4]), 2);
	setBiquad(chan, &(m_highpass_coefs2[4]), 3);
}
void Headstage::setFlat(int chan){
	//lets you look at the raw ADC samples.
	int tid = chan/128;
	//chan = chan & (0xff ^ 32); //map to the lower channels.
	chan = chan & ( (128*(tid+1)-1) ^ 32); //the above mapping was not working for anything > 256
	float biquad[] = {0.0, 1.0, 0.0, 0.0}; //NOTE B assumed to be symmetric.
		//hence you need to set b[1] not b[0] (and b[2])
	setBiquad(chan, biquad, 0);
	setBiquad(chan, biquad, 1);
	setBiquad(chan, biquad, 2);
	setBiquad(chan, biquad, 3);
	saveMessage(tid, "flat %d thread %d", chan, tid);
	saveMessage(tid, "flat %d thread %d", chan+32, tid);
}
#endif

void Headstage::setAll(int signalChain){
	//update the channels.
	setChans(signalChain);
	//the filters.. also updates the gains.
	for(int t = 0; t<NSCALE; t++){
			int sh = 128*t; //128 channel offset per bridge
			
			for(int i=0; i<32; i++){
				resetBiquads(sh+i);
				resetBiquads(sh+i+64);
			}
			for(int i=0; i<16; i++){
				//can transmit 8 AGCs at a time.
				//will set i, i+32, i+16. i+48, i+64, i+96, i+80, i+112.
				setAGC(sh+i, sh+i+16, sh+i+64, sh+i+80);
			}
			for(int i=0; i<32; i++){
				setAperture(sh+i);
			}
			//finally, the templates.
			for(int i=0; i<32; i++){
				setTemplate(sh+i,0);
				setTemplate(sh+i,1);
			}
	}
}
