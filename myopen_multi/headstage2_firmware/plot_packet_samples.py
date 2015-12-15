'''
Memory files obtained from copying gdb output, after executing firmware
and dumping one frame of 16-packet data.

Usage 12/4/2015:
    Used after running firmware1.asm or firmware2.asm, and run
        set logging redirect on
        set logging on
        x/256xw $p2     (or whatever memory address WF_BUF is)
        set logging off
    Then, move gdb.txt to somefile.txt

        plot_packet(fname, nbits=8, nchannels=4)
    will plot all of nchannels, with a single amplifier (32 max), in the order of
    ch31, ch0, ch1, ch2,...
    
    nbits is 8 or 16, depending on how many bits each channel's saved as.
    nchannels determines how many channels were saved in the memory. firmware1 and firmware2
    uses 32 so far.

Usage 12/11/2015 (updated):
    Use after running firmware2.asm, and run
        set logging redirect on
        set logging on
        x/1024xw 0xff804000
        set logging off
    Then, move gdb.txt to somefile.txt..
        
        plot_packet_allChannels(fname)

    Assumes the given file contains samples from all 128 channels, in the order of:
    Ch[31,63,95,127], Ch[0,32,64,96], Ch[1,33,65,97], ...
'''

import numpy as np
import matplotlib.pyplot as plt

VH = 3.37
gain = 196
scaler = VH/0xffff/196*1000 # convert to mV

def load_mem_values(fname):
    # Read in the hex values, save in array data. Each entry is a 32-bit word
    f = open(fname, 'r')

    data = []
    for line in f.readlines():
        for val in ((line.split(':'))[1].replace('\n','').split('\t'))[1:]:
            data.append(int(val, 16))
    f.close()
    return data

def to8bits(n):
    '''
    Given a 32-bit word, split and return the four 8-bits word.
    Return order from lo to hi address.
    '''
    return [(n & 0xff), (n >> 8 & 0xff), (n >> 16 & 0xff), (n >> 24 & 0xff)]

def to16bits(n):
    '''
    Given a 32-bit word, split and return the two 16-bit words.
    Return order from lo to hi address.
    '''
    return [(n & 0xffff), (n >> 16 & 0xffff)]

def convert_mem_values(data, nbits=8):
    new_data = []
    if nbits==8:
        func = to8bits
    elif nbits==16:
        func = to16bits

    for i in data:
        new_data.extend(func(i))
    return new_data

def extract_packets(data, nbits=8):
    '''
    Total data consists of 16 packets of 32-bytes.

    If bits=8, that means each data is 1-byte long, so each packet has 32 values.
    If bits=16, that means each data is 2-bytes long, so each packet has 16 values.
    '''
    n_pkt = 16
    packets = []
    if nbits==8:
        nval = 32
    elif nbits==16:
        nval = 16

    for i in xrange(n_pkt):
        packets.append(data[i*nval : (i+1)*nval])
    return packets

def extract_samples(packets, nbits=8, nchannels=4):
    '''
    Format of packet is (nbits=8):
        - 24 bytes of sample, 6 samples from each of 4 channels.
        - 8 bytes of tmpl match

    Each sample is sampled from 31.25kHz. Each packet is 32 bytes.
    Don't care about tmpl match

    16-packets is then 16*6=96 samples per channel.

    ----------------------------
    For nbits=16, we extract directly from the packet:
    16*32 bytes = 512 bytes, which includes: 8 samples/ch * 32 ch * 2 bytes/sample = 512 bytes.
   '''
    channels = [list() for i in xrange(nchannels)]
    for pkt in packets:
        if nbits==8:
            for i in xrange(24):
                #24 samples/pkt
                channels[i%nchannels].append(pkt[i])
        elif nbits==16:
            # then we only have 1 element inside packets
            #for i in xrange(len(pkt)):
            #    channels[i%nchannels].append(pkt[i])
            ch = 31
            for i in xrange(len(pkt)):
                channels[ch].append(pkt[i])
                ch = (ch+1)%32
    return channels

def plot_samples(channels, nbits=8, nchannels=4, title=None):
    '''
    Plot all 6*16=96 samples for each channel (8-bits)

    Or plot all 6*4=24 samples for each channel (16-bits)
    '''
    xx = range(len(channels[0]))
    maxes = [max(i) for i in channels]
    mins = [min(i) for i in channels]
    
    if nbits==8:
        overset=10
    elif nbits==16:
        # 16-bits values are plotted in mV.
        overset=1

    plt.figure()

    if nchannels <= 4:
        ncols = 1
        nrows = 4
        for ch in xrange(len(channels)):
            plt.subplot(nrows, ncols, ch+1)
            plt.plot(xx, channels[ch], 'b-*')
            plt.ylim(min(mins)-overset, max(maxes)+overset)
        plt.show(block=False)

    else:
        ncols = 6
        nrows = np.ceil(nchannels/float(ncols))
        for ch in xrange(nchannels):
            plt.subplot(nrows, ncols, ch+1)
            plt.plot(xx, channels[ch], 'b-*')
            plt.ylim(min(mins)-overset, max(maxes)+overset)
        plt.suptitle(title)
        plt.show(block=False)

    return channels
    
def plot_packet(fname, nbits=8, nchannels=4):
    data = load_mem_values(fname)
    data = convert_mem_values(data, nbits)
    if nchannels==4:
        # this is used when we are processing actual radio-transmission packet.
        # only 4 channels of raw channel included.
        packets = extract_packets(data, nbits)
        channels = extract_samples(packets, nbits, nchannels)
    else:
        channels = extract_samples([data], nbits, nchannels)
    return plot_samples(channels, nbits, nchannels)

#----------------- For looking at 128 channels at the same time -----------------
def extract_128ch_samples(data):
    '''
    Each value is a sample for channel [31,63,95,127,0,32,64,96,1,33,65,97...]
    '''
    channels = [list() for i in xrange(128)]
    ch = 31
    for i in range(0,len(data),4):
        channels[ch].append(data[i])
        channels[ch+32].append(data[i+1])
        channels[ch+64].append(data[i+2])
        channels[ch+96].append(data[i+3])
        ch = (ch+1)%32
    return channels

def plot_128channels(channels):
    plot_samples(channels[0:32], 16, 32, 'Amp1')
    plot_samples(channels[32:64], 16, 32, 'Amp2')
    plot_samples(channels[64:96], 16, 32, 'Amp3')
    plot_samples(channels[96:128], 16, 32, 'Amp4')
    return channels

def plot_packet_allChannels(fname):
    data = load_mem_values(fname)
    data = convert_mem_values(data, 16)
    channels = extract_128ch_samples(data)
    return plot_128channels(channels)





