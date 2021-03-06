#ifndef __HEADSTAGE_H__
#define __HEADSTAGE_H__

#include "gtkclient.h"
#include "channel.h"
//globals.  could make a class for these but .. David will do it
//yeah let's make a class shall we

class Headstage{

private:
	unsigned int*	m_sendbuf[NSCALE];
	i64		m_sendW[NSCALE]; //where to write to (in 32-byte increments)
	i64 		m_sendR[NSCALE]; //where to read from
	i64		m_sendL[NSCALE]; //the length of the buffer (in 32-byte packets)
	char		m_messages[NSCALE][1024][128]; //save these, plaintext, in the file.
	i64		m_messW[NSCALE];
	i64		m_messR[NSCALE];

	unsigned int m_echo[NSCALE] = {0};
	unsigned int m_headecho[NSCALE] = {0};
	unsigned int m_oldheadecho[NSCALE] = {100};
	unsigned int m_echoMask = 0x0fffffff; //used to clear address bits
	  // 0xffffffff puts gtkclient in compatability mode. (before svn v 605)
	  // 0x0fffffff puts gtkclient in echo mode. (after svn v. 605)
	  
	std::vector<Channel*> m_c;
	int*	 m_channel;
public:
	Headstage();
	Headstage(int*, const std::vector<Channel*>&);	

	void saveMessage(const char *fmt, ...); //for all threads
	void saveMessage(int threadID, const char *fmt, ...); //some messages are thread specific
#if defined(HEADSTAGE_TIM) || defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
	void updateIIRGain(int chan);
#elif defined(RADIO_GAIN_IIR_SAA)
    void updatePreGain(int chan);
#endif
	void setOsc(int chan);
	void setChans(int signalChain);
	void setAGC(int ch1, int ch2, int ch3, int ch4);
	void enableAGC(int* chs);
	void setAperture(int ch);
	void setLMS(bool on);
	void setTemplate(int ch, int aB);
	void setBiquad(int chan, float* biquad, int biquadNum);
	void resetBiquads(int chan);

#ifdef HEADSTAGE_TIM
	void setFilter2(int chan);
	void setFlat(int chan);
#endif
	void setAll(int signalChain);
	
	i64 getMessW (int threadID);
	i64 getMessR (int threadID);
	char* getMessages (int thread, int index);
	i64 getSendW (int threadID);
	i64 getSendR (int threadID);
	i64 getSendL (int threadID);
	
	void incrMessR(int threadID);
	void incrSendR(int threadID);
	void freeSendbuf(int threadID);
	unsigned int* getSendbuf(int threadID);
	
	unsigned int getOldHeadecho (int threadID);
	void setOldHeadecho (int threadID); //internal
	unsigned int getHeadecho (int threadID);
	unsigned int getEcho (int threadID);
	
	
	unsigned int echoHeadstage(unsigned int echoID, unsigned int address);
	
private:
#ifdef HEADSTAGE_TIM
  /** 500 - 6.7kHz **/
  float m_lowpass_coefs[8] ={ 0.240833,0.481711,0.323083,-0.456505,
					  0.240833,0.481619,0.233390,-0.052153};
  float m_highpass_coefs[8] ={0.936405,-1.872810,1.916303,-0.926028,
					  0.936405,-1.872810,1.821050,-0.830291};
  /** 150 - 10kHz **/
  float m_lowpass_coefs2[8] = {0.453447,0.906993,-0.632535,-0.485595,
	  0.453447,0.906796,-0.463824,-0.089354};
  float m_highpass_coefs2[8] = {0.980489,-1.960979,1.976285,-0.977184,
	  0.980489,-1.960979,1.944907,-0.945792};
#elif defined(RADIO_AGC_IIR) || defined(RADIO_AGC_IIR_SAA) || defined(RADIO_GAIN_IIR_SAA) || defined(RADIO_AGC_LMS_IIR_SAA)
  // These firmware versions only have 1 LPF and 1 HPF
  /** 250 - 9kHz **/
  // equal to [6004, 12008, -4595, -3039]/16384...so they are Q14.
  float m_lowpass_coefs[4] = {0.366455, 0.732910, -0.280456, -0.185486};
  // equal to [15812, -31624, 31604, -15260]/16384
  float m_highpass_coefs[4] = {0.965088, -1.930176, 1.928955, -0.931396};
#endif
	
};
#endif
