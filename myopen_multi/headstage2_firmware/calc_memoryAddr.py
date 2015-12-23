"""
Script to check gtkclient is calculating variable address correctly.
"""
A1 = 0xFF904000     # may change
A1_AGC = 4          # may change
A1_LMS = 0          # may change
A1_IIR = 0          # may change
A1_TEMPLATE = 0     # may change
A1_APERTURE = 0     # may change
A1_IIRSTARTA = A1_AGC + A1_LMS
A1_AGCB = A1_IIRSTARTA + A1_IIR
A1_IIRSTARTB = A1_AGCB + A1_AGC + A1_LMS
A1_TEMPA = A1_IIRSTARTB + A1_IIR
A1_APERTUREA = (A1_TEMPA + A1_TEMPLATE)
A1_TEMPB = (A1_APERTUREA + A1_APERTURE)
A1_APERTUREB = (A1_TEMPB + A1_TEMPLATE)
A1_STRIDE = (A1_APERTUREB + A1_APERTURE)

W1 = 0xFF804000
W1_STRIDE = 4       # may change

FP_CHAN = 4
FP_QS =	8 
FP_QPACKETS =12
FP_ADDRESS = 16
FP_VALUE = 20
FP_TXCHAN3 = 24
FP_TXCHAN2 = 28
FP_TXCHAN1 = 32
FP_TXCHAN0 = 36
FP_TIMER = 40
FP_WEIGHTDECAY = 44
FP_8080 = 48
FP_5555 = 52
FP_AAAA = 56
FP_SPORT0_RX = 60
FP_SPI_TDBR = 64
FP_FIO_FLAG_D = 68
FP_MATCH_BASE = 72 
FP_MATCH_PTR7 = 76
FP_ENC_LUT_BASE = 80
FP_STATE_LUT_BASE = 84
FP_ECHO = 88
FP_BLINK = 92

def setAGC(chan):
    """
    Gives what address setAGC will return
    """
    tid = chan/128
    chan = chan & ( (128*(tid+1)-1)^32)
    p = 0
    kchan = chan & 127
    if kchan >= 64:
        p = p+1
    addr = A1 + (A1_STRIDE*(kchan & 31) + p*(A1_IIRSTARTA+A1_IIR) +2)*4
    return hex(addr)

def setChans(c, signalChain):
    """
    Gives the address of the signalChain values to be streamed
    
    Value of signalChain can be:

            4th offset is to get to the correct written delay.
            Tim's signal chain   | Allen's signal chain
        0	mean from integrator |  original sample
        1	gain                 |  integrated mean
        2	saturated sample     |  AGC-gain
        3	AGC out / LMS save   |  AGC-output
        4	x1(n-1) / LMS out
        5	x1(n-2)
        6	x2(n-1) / y1(n-1)
        7	x2(n-2) / y1(n-2)
        8	x3(n-1) / y2(n-1)
        9	x3(n-2) / y2(n-2)
        10	x2(n-1) / y3(n-1)
        11	x2(n-2) / y3(n-2)
        12	y4(n-1)
        13	y4(n-2)

    c is channel number
    """
    tid = c/128
    o1 = (c & 31) * W1_STRIDE * 2 *4
    o2 = ((c & 64)>>6) * W1_STRIDE * 4
    o3 = ((c & 32)>>5) * 2
    o4 = signalChain * 4
    return hex(W1 + o1 + o2 + o3 + o4 + 1)
    

