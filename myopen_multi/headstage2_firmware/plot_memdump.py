"""
memory files obtained from copying gdb output must be first processed.

In vim, use regex command "%s/.\+:\s\+//g" to delete the address/pointer field.

Edit 11/15/2015: No longer need the regex command, just save gdb.txt to whatever and run.
                 The regex is taken care of in load_mem_values
"""
import numpy as np
import matplotlib.pyplot as plt

def load_mem_values(fname):
    # Read in the hex values, save in array data
    f = open(fname, 'r')

    data = []
    for line in f.readlines():
        for val in ((line.split(':'))[1].replace('\n','').split('\t'))[1:]:
            data.append(int(val, 16))

    f.close()
    return data

def to16bits(n):
    '''
    Given a 32-bits word, split and return the two 16-bits word.
    Return order is the lower word, followed by the higher word
    '''
    return ((n & 0xffff),(n >> 16 & 0xffff))

def convert_mem_values(data):
    new_data = [];
    for i in data:
        new_data.extend(to16bits(i))
    return new_data

def check_setup_values(data):
    '''
    Every memory test, the response to the Intan-setup sequence should return for each
    amplifier the following, in order:
    1. [rubbish, rubbish, rubbish] - the first two frame-sync cycles output whatever is
       in Intan's pipeline. The third one is a repeat of the first command, which often glitches
       and is sent again.
    2. [0xffde, 0xff02, 0xff04, 0xff00, 0xff80,0xff00, 0xff00, 0xff00, 0xff16, 0xff00, 0xff17, 0xff00, 
        0xff15, 0xff00, 0xffff, 0xffff, 0xffff, 0xffff] - These are the return values in response
       to writing to the Intan registers.
    3. [0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000] - Values in
       response to the calibration command and the 9 dummy commands proceeding it.
    4. [0x0049, 0x004e, 0x0054, 0x0041, 0x004e] - Reading reg40-44, which spells out INTAN in ASCII.

    Input is the entire memory content.
    Output the memory content, minus the first 36 set of values.
    '''
    rubbish_length = 3
    n_amp = 4
    setup_list = [0xffde, 0xff02, 0xff04, 0xff00, 0xff80,0xff00, 0xff00, 0xff00, 0xff16, 0xff00, 0xff17, 0xff00, \
                  0xff15, 0xff00, 0xffff, 0xffff, 0xffff, 0xffff]
    calib_list = [0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000]
    intan_list = [0x0049, 0x004e, 0x0054, 0x0041, 0x004e]

    master_list = list(setup_list)
    master_list.extend(calib_list)
    master_list.extend(intan_list)

    wanted = data[rubbish_length*n_amp : len(master_list)*4 + rubbish_length*n_amp]
    i = 0   # index master_list
    while i < len(master_list):
        memvals = [wanted[k] for k in [j+i*n_amp for j in range(n_amp)] ]
        if all(val==master_list[i] for val in memvals):
            i = i+4
        else:
            print "Setup values incorrect! Expected %s, %s\n" % \
                    (hex(master_list[i]), [hex(val) for val in memvals])
            i = i+4

    return data[36*4:]

def plot_mem_vals1(data):
    '''
    This method assumes we are getting samples for 1 period of f, for a fixed channel
    in n amplifiers. Each sample is 16-bits. Therefore, we need to examine a total of:

        156 sample/period x 4 amps = 624 samples,

    from the input data, if we are sampling a 6.4kHz wave with 1MHz, from 4 amps.
    
    Every set of four values are in order of amp1, 2, 3, and 4.
    '''
    f = 6.4*10**3   # freq of signal
    f_s = 10**6     # 1MHz sampling freq
    sample_per_period = int(f_s/f)  # closest integer sample amount
    n_periods = 2
    n_amp = 4
    amp1 = [data[i] for i in range(sample_per_period*n_amp*n_periods) if i%4==0]
    amp2 = [data[i] for i in range(sample_per_period*n_amp*n_periods) if i%4==1]
    amp3 = [data[i] for i in range(sample_per_period*n_amp*n_periods) if i%4==2]
    amp4 = [data[i] for i in range(sample_per_period*n_amp*n_periods) if i%4==3]

    '''
    Convert the ADC output to voltage values:
    The outputs are in binary offset, where 0x0000 corresponds to 0V, and 0xffff = 3.37V,
    when connected to JTAG.

    The amps have a gain of 196. So to get the actual input value in mV, we do:

        (3.37/65535)*val/196*1000
    where 65535=0xffff.

    '''
    VH = 3.37
    gain = 196
    scaler = VH/0xffff/196*1000 # convert to mV

    amp1 = [i*scaler for i in amp1]
    amp2 = [i*scaler for i in amp2]
    amp3 = [i*scaler for i in amp3]
    amp4 = [i*scaler for i in amp4]
    
    xx = range(len(amp1))
    p, (ax1, ax2, ax3, ax4) = plt.subplots(4, sharex=True, sharey=True)
    ax1.plot(xx, amp1, color='blue')
    ax2.plot(xx, amp2, color='red')
    ax3.plot(xx, amp3, color='green')
    ax4.plot(xx, amp4, color='black')
    ax1.set_ylabel('Signal (mV)')
    ax4.set_xlabel('Time (uS)')
    plt.show()

    return (amp1, amp2, amp3, amp4)

data = load_mem_values('memdump2.txt')
data = convert_mem_values(data)
data = check_setup_values(data)
amp1,amp2,amp3,amp4 = plot_mem_vals1(data)



    

    





