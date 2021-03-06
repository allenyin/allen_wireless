f = open('stuff.txt', 'w')
# ------------ W1 ---------------





# RADIO_AGC
'''
i = 1
while i<32:
    a = 32*3-i
    b = 32*4-i
    c = 32*1-i
    d = 32*2-i
    f.write("CH%d final sample\tCH%d final sample\n" % (a,b))
    f.write("CH%d AGC gain\tCH%d AGC gain\n" % (a,b))
    f.write("CH%d integrator mean\tCH%d integrator mean\n" % (a,b))
    f.write("CH%d sample\tCH%d sample\n" % (a,b))
    f.write("CH%d final sample\tCH%d final sample\n" % (c,d))
    f.write("CH%d AGC gain\tCH%d AGC gain\n" % (c,d))
    f.write("CH%d integrator mean\tCH%d integrator mean\n" % (c,d))
    f.write("CH%d sample\tCH%d sample\n" % (c,d))
    i = i+1
f.close()
'''

# RADIO_AGC+IIR
'''
i = 1
while i<32:
    a = 32*3-i
    b = 32*4-i
    c = 32*1-i
    d = 32*2-i
    f.write("CH%d IIR: y2(n-2)\tCH%d IIR: y2(n-2)\n" % (a,b))
    f.write("CH%d IIR: y2(n-1)\tCH%d IIR: y2(n-1)\n" % (a,b))
    f.write("CH%d IIR: y1(n-2)\tCH%d IIR: y1(n-2)\n" % (a,b))
    f.write("CH%d IIR: y1(n-1)\tCH%d IIR: y1(n-1)\n" % (a,b))
    f.write("CH%d IIR: x0(n-2)\tCH%d IIR: x0(n-2)\n" % (a,b))
    f.write("CH%d IIR: x0(n-1)\tCH%d IIR: x0(n-2)\n" % (a,b))
    f.write("CH%d AGC-out\tCH%d AGC-out\n" % (a,b))
    f.write("CH%d AGC gain\tCH%d AGC gain\n" % (a,b))
    f.write("CH%d integrator mean\tCH%d integrator mean\n" % (a,b))
    f.write("CH%d sample\tCH%d sample\n" % (a,b))

    f.write("CH%d IIR: y2(n-2)\tCH%d IIR: y2(n-2)\n" % (c,d))
    f.write("CH%d IIR: y2(n-1)\tCH%d IIR: y2(n-1)\n" % (c,d))
    f.write("CH%d IIR: y1(n-2)\tCH%d IIR: y1(n-2)\n" % (c,d))
    f.write("CH%d IIR: y1(n-1)\tCH%d IIR: y1(n-1)\n" % (c,d))
    f.write("CH%d IIR: x0(n-2)\tCH%d IIR: x0(n-2)\n" % (c,d))
    f.write("CH%d IIR: x0(n-1)\tCH%d IIR: x0(n-2)\n" % (c,d))
    f.write("CH%d AGC-out\tCH%d AGC-out\n" % (c,d))
    f.write("CH%d AGC gain\tCH%d AGC gain\n" % (c,d))
    f.write("CH%d integrator mean\tCH%d integrator mean\n" % (c,d))
    f.write("CH%d sample\tCH%d sample\n" % (c,d))
    
    i = i+1
f.close()
'''
# RADIO_gain_IIR_SAA
'''
i = 1
while i<32:
    a = 32*3-i
    b = 32*4-i
    c = 32*1-i
    d = 32*2-i
    f.write("CH%d IIR: y2(n-2)\tCH%d IIR: y2(n-2)\n" % (a,b))
    f.write("CH%d IIR: y2(n-1)\tCH%d IIR: y2(n-1)\n" % (a,b))
    f.write("CH%d IIR: y1(n-2)\tCH%d IIR: y1(n-2)\n" % (a,b))
    f.write("CH%d IIR: y1(n-1)\tCH%d IIR: y1(n-1)\n" % (a,b))
    f.write("CH%d IIR: x0(n-2)\tCH%d IIR: x0(n-2)\n" % (a,b))
    f.write("CH%d IIR: x0(n-1)\tCH%d IIR: x0(n-2)\n" % (a,b))
    f.write("CH%d amp-out\tCH%d amp-out\n" % (a,b))
    f.write("CH%d sample\tCH%d sample\n" % (a,b))

    f.write("CH%d IIR: y2(n-2)\tCH%d IIR: y2(n-2)\n" % (c,d))
    f.write("CH%d IIR: y2(n-1)\tCH%d IIR: y2(n-1)\n" % (c,d))
    f.write("CH%d IIR: y1(n-2)\tCH%d IIR: y1(n-2)\n" % (c,d))
    f.write("CH%d IIR: y1(n-1)\tCH%d IIR: y1(n-1)\n" % (c,d))
    f.write("CH%d IIR: x0(n-2)\tCH%d IIR: x0(n-2)\n" % (c,d))
    f.write("CH%d IIR: x0(n-1)\tCH%d IIR: x0(n-2)\n" % (c,d))
    f.write("CH%d amp-out\tCH%d amp-out\n" % (c,d))
    f.write("CH%d sample\tCH%d sample\n" % (c,d))

    i = i+1
f.close()
'''

'''
#------------ A1 --------------
# RADIO_AGC
i = 1
while i<33:
    a = 32*3-i
    b = 32*4-i
    c = 32*1-i
    d = 32*2-i
    f.write("CH%d,%d AGC gain scaler=(Q15)16384\tCH%d,%d AGC enable=1\n" % (a,b,a,b))
    f.write("CH%d AGC target sqrt=9915\tCH%d AGC target sqrt=9915\n" % (a,b))
    f.write("CH%d,%d integ 16384=(Q15)0.5\tCH%d,%d integ mu 800=(Q15)0.0244\n" % (a,b,a,b))
    f.write("CH%d,%d integ 32767=(Q15)1\tCH%d,%d integ -16384=(Q15)-0.5\n" % (a,b,a,b))
    f.write("CH%d,%d AGC gain scaler=(Q15)16384\tCH%d,%d AGC_enable=1\n" % (c,d,c,d))
    f.write("CH%d AGC target sqrt=9915\tCH%d AGC target sqrt=9915\n" % (c,d))
    f.write("CH%d,%d integ 16384=(Q15)0.5\tCH%d,%d integ mu 800=(Q15)0.0244\n" % (c,d,c,d))
    f.write("CH%d,%d integ 32767=(Q15)1\tCH%d,%d integ -16384=(Q15)-0.5\n" % (c,d,c,d)) 
    i = i+1
f.close()
'''

'''
# RADIO_AGC_IIR
i = 1
while i<33:
    a = 32*3-i
    b = 32*4-i
    c = 32*1-i
    d = 32*2-i
    f.write("CH%d HPF1 a1=-15172\tCH%d HPF1 a1=-15172\n" % (a,b))
    f.write("CH%d HPF1 a0=31397\tCH%d HPF1 a0=31397\n" % (a,b))
    f.write("CH%d HPF1 b1=-30687\tCH%d HPF1 b1=-30687\n" % (a,b))
    f.write("CH%d HPF1 b0=15342\tCH%d HPF1 b0=15342\n" % (a,b))
    f.write("CH%d LPF1 a1=-854\tCH%d LPF1 a1=-854\n" % (a,b))
    f.write("CH%d LPF1 a0=3824\tCH%d LPF1 a0=3824\n" % (a,b))
    f.write("CH%d LPF1 b1=15782\tCH%d LPF1 b1=15782\n" % (a,b))
    f.write("CH%d LPF1 b0=7892\tCH%d LPF1 b0=7892\n" % (a,b))
    f.write("CH%d,%d AGC gain scaler=(Q15)16384\tCH%d,%d AGC enable=1\n" % (a,b,a,b))
    f.write("CH%d AGC target sqrt=9915\tCH%d AGC target sqrt=9915\n" % (a,b))
    f.write("CH%d,%d integ 16384=(Q15)0.5\tCH%d,%d integ mu 800=(Q15)0.0244\n" % (a,b,a,b))
    f.write("CH%d,%d integ 32767=(Q15)1\tCH%d,%d integ -16384=(Q15)-0.5\n" % (a,b,a,b))

    f.write("CH%d HPF1 a1=-15172\tCH%d HPF1 a1=-15172\n" % (c,d))
    f.write("CH%d HPF1 a0=31397\tCH%d HPF1 a0=31397\n" % (c,d))
    f.write("CH%d HPF1 b1=-30687\tCH%d HPF1 b1=-30687\n" % (c,d))
    f.write("CH%d HPF1 b0=15342\tCH%d HPF1 b0=15342\n" % (c,d))
    f.write("CH%d LPF1 a1=-854\tCH%d LPF1 a1=-854\n" % (c,d))
    f.write("CH%d LPF1 a0=3824\tCH%d LPF1 a0=3824\n" % (c,d))
    f.write("CH%d LPF1 b1=15782\tCH%d LPF1 b1=15782\n" % (c,d))
    f.write("CH%d LPF1 b0=7892\tCH%d LPF1 b0=7892\n" % (c,d))
    f.write("CH%d,%d AGC gain scaler=(Q15)16384\tCH%d,%d AGC_enable=1\n" % (c,d,c,d))
    f.write("CH%d AGC target sqrt=9915\tCH%d AGC target sqrt=9915\n" % (c,d))
    f.write("CH%d,%d integ 16384=(Q15)0.5\tCH%d,%d integ mu 800=(Q15)0.0244\n" % (c,d,c,d))
    f.write("CH%d,%d integ 32767=(Q15)1\tCH%d,%d integ -16384=(Q15)-0.5\n" % (c,d,c,d)) 
    i = i+1
f.close()
'''

# RADIO_ALL...extra template and aperture memory 
'''
i = 1
while i<33:
    a = 32*3-i # 64
    b = 32*4-i # 96
    c = 32*1-i # 0
    d = 32*2-i # 32
    f.write("Aperture %dB\tAperture %dB\n" % (a,b))
    f.write("Aperture %dB\tAperture %dB\n" % (c,d))
    f.write("Template %dB(t)\tTemplate %dB(t)\tTemplate %dB(t)\tTemplate %dB(t)\n" % (c,d,a,b))
    for j in range(1,16):
        f.write("Template %dB(t-%d)\tTemplate %dB(t-%d)\tTemplate %dB(t-%d)\tTemplate %dB(t-%d)\n" % (c,j,d,j,a,j,b,j))
    
    f.write("Aperture %dA\tAperture %dA\n" % (a,b))
    f.write("Aperture %dA\tAperture %dA\n" % (c,d))
    for j in range(1,16):
        f.write("Template %dA(t-%d)\tTemplate %dA(t-%d)\tTemplate %dA(t-%d)\tTemplate %dA(t-%d)\n" % (c,j,d,j,a,j,b,j))
    f.write("Template %dA(t)\tTemplate %dA(t)\tTemplate %dA(t)\tTemplate %dA(t)\n" % (c,d,a,b))

    f.write("CH%d HPF1 a1=-15172\tCH%d HPF1 a1=-15172\n" % (a,b))
    f.write("CH%d HPF1 a0=31397\tCH%d HPF1 a0=31397\n" % (a,b))
    f.write("CH%d HPF1 b1=-30687\tCH%d HPF1 b1=-30687\n" % (a,b))
    f.write("CH%d HPF1 b0=15342\tCH%d HPF1 b0=15342\n" % (a,b))
    f.write("CH%d LPF1 a1=-854\tCH%d LPF1 a1=-854\n" % (a,b))
    f.write("CH%d LPF1 a0=3824\tCH%d LPF1 a0=3824\n" % (a,b))
    f.write("CH%d LPF1 b1=15782\tCH%d LPF1 b1=15782\n" % (a,b))
    f.write("CH%d LPF1 b0=7892\tCH%d LPF1 b0=7892\n" % (a,b))
    f.write("CH%d,%d AGC gain scaler=(Q15)16384\tCH%d,%d AGC enable=1\n" % (a,b,a,b))
    f.write("CH%d AGC target sqrt=9915\tCH%d AGC target sqrt=9915\n" % (a,b))
    f.write("CH%d,%d integ 16384=(Q15)0.5\tCH%d,%d integ mu 800=(Q15)0.0244\n" % (a,b,a,b))
    f.write("CH%d,%d integ 32767=(Q15)1\tCH%d,%d integ -16384=(Q15)-0.5\n" % (a,b,a,b))

    f.write("CH%d HPF1 a1=-15172\tCH%d HPF1 a1=-15172\n" % (c,d))
    f.write("CH%d HPF1 a0=31397\tCH%d HPF1 a0=31397\n" % (c,d))
    f.write("CH%d HPF1 b1=-30687\tCH%d HPF1 b1=-30687\n" % (c,d))
    f.write("CH%d HPF1 b0=15342\tCH%d HPF1 b0=15342\n" % (c,d))
    f.write("CH%d LPF1 a1=-854\tCH%d LPF1 a1=-854\n" % (c,d))
    f.write("CH%d LPF1 a0=3824\tCH%d LPF1 a0=3824\n" % (c,d))
    f.write("CH%d LPF1 b1=15782\tCH%d LPF1 b1=15782\n" % (c,d))
    f.write("CH%d LPF1 b0=7892\tCH%d LPF1 b0=7892\n" % (c,d))
    f.write("CH%d,%d AGC gain scaler=(Q15)16384\tCH%d,%d AGC_enable=1\n" % (c,d,c,d))
    f.write("CH%d AGC target sqrt=9915\tCH%d AGC target sqrt=9915\n" % (c,d))
    f.write("CH%d,%d integ 16384=(Q15)0.5\tCH%d,%d integ mu 800=(Q15)0.0244\n" % (c,d,c,d))
    f.write("CH%d,%d integ 32767=(Q15)1\tCH%d,%d integ -16384=(Q15)-0.5\n" % (c,d,c,d)) 
    i = i+1
f.close()
'''

# RADIO_gain_IIR_SAA
i = 1
while i<33:
    a = 32*3-i # 64
    b = 32*4-i # 96
    c = 32*1-i # 0
    d = 32*2-i # 32
    f.write("Aperture %dB\tAperture %dB\n" % (a,b))
    f.write("Aperture %dB\tAperture %dB\n" % (c,d))
    f.write("Template %dB(t)\tTemplate %dB(t)\tTemplate %dB(t)\tTemplate %dB(t)\n" % (c,d,a,b))
    for j in range(1,16):
        f.write("Template %dB(t-%d)\tTemplate %dB(t-%d)\tTemplate %dB(t-%d)\tTemplate %dB(t-%d)\n" % (c,j,d,j,a,j,b,j))
    
    f.write("Aperture %dA\tAperture %dA\n" % (a,b))
    f.write("Aperture %dA\tAperture %dA\n" % (c,d))
    for j in range(1,16):
        f.write("Template %dA(t-%d)\tTemplate %dA(t-%d)\tTemplate %dA(t-%d)\tTemplate %dA(t-%d)\n" % (c,j,d,j,a,j,b,j))
    f.write("Template %dA(t)\tTemplate %dA(t)\tTemplate %dA(t)\tTemplate %dA(t)\n" % (c,d,a,b))

    f.write("CH%d HPF1 a1=-15172\tCH%d HPF1 a1=-15172\n" % (a,b))
    f.write("CH%d HPF1 a0=31397\tCH%d HPF1 a0=31397\n" % (a,b))
    f.write("CH%d HPF1 b1=-30687\tCH%d HPF1 b1=-30687\n" % (a,b))
    f.write("CH%d HPF1 b0=15342\tCH%d HPF1 b0=15342\n" % (a,b))
    f.write("CH%d LPF1 a1=-854\tCH%d LPF1 a1=-854\n" % (a,b))
    f.write("CH%d LPF1 a0=3824\tCH%d LPF1 a0=3824\n" % (a,b))
    f.write("CH%d LPF1 b1=15782\tCH%d LPF1 b1=15782\n" % (a,b))
    f.write("CH%d LPF1 b0=7892\tCH%d LPF1 b0=7892\n" % (a,b))
    f.write("CH%d,%d gain\tCH%d,%d gain\n" % (a,b,a,b))

    f.write("CH%d HPF1 a1=-15172\tCH%d HPF1 a1=-15172\n" % (c,d))
    f.write("CH%d HPF1 a0=31397\tCH%d HPF1 a0=31397\n" % (c,d))
    f.write("CH%d HPF1 b1=-30687\tCH%d HPF1 b1=-30687\n" % (c,d))
    f.write("CH%d HPF1 b0=15342\tCH%d HPF1 b0=15342\n" % (c,d))
    f.write("CH%d LPF1 a1=-854\tCH%d LPF1 a1=-854\n" % (c,d))
    f.write("CH%d LPF1 a0=3824\tCH%d LPF1 a0=3824\n" % (c,d))
    f.write("CH%d LPF1 b1=15782\tCH%d LPF1 b1=15782\n" % (c,d))
    f.write("CH%d LPF1 b0=7892\tCH%d LPF1 b0=7892\n" % (c,d))
    f.write("CH%d,%d gain\tCH%d,%d gain\n" % (c,d,c,d))
    i = i+1
f.close()



