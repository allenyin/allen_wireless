firmware.asm: What I thought the firmware should've been like, the same as radio5.asm, except with extra SPORT initialization/acquisition.

firmware1.asm: Integrated intan_test_setup2 into the firmware structure...after the setup process, repeatedly poll all for SPORT, but saves all channels from just one amp to WF_BUF. This allows for 256 32-bit words, which is equivalent to getting 16 samples from all 32-channels of the designated amplifier. After saving the samples, part of the signal chain (AGC+IIR+SAA) was used to see how much code-path can be fit in before data corruption happens. The data in WFBUF can be dumped after it's full and plotted with plot_packet_samples.py (plot_packet('bla.txt', 16, 32)). No radio code.

firmware2.asm: Same as firmware1.asm, except the extra signal path code is replaced with nops to investiage code-length issues.

intan_test_setup.asm: Polls the same channel from all amps, and save periods to memory starting at FP_BASE (0xFF906F00). Plot the result using plot_memdump.py. \

intan_test_setup2.asm: Tests the intra-amp performance. Records a set number of periods from all 32 channels of a fixed amp, save to memory in A1 (0xFF904000). Results include Intan-setup responses. Plot the result using plot_memdump.py.

radio_basic.asm: Built off firmware2.asm, but integrate in radio communication with gtkclient.
