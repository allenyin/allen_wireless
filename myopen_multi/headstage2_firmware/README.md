#Firmware for RHD-based wireless headstages.

The final version is radio_AGC_IIR_SAA.asm. Usage example:

1. Connect cables as the following ()...
2. Uncomment the `FIMRWARE_VERSION=radio_AGC_IIR_SAA` line in Makefile.
3. Type `make clean; make; make flash`
4. If error occurs on the `make flash` step, do `sudo rmmod lp; sudo modprobe ppdev` so pyparallel
   can access the parallel port.
5. Go to ../gtkclient_multi, in Makefile, change the option `RADIO_AGC_IIR_SAA` to true, while setting
   all options among `HEADSTAGE_TIM`, `RADIO_BASIC`, `RADIO_AGC`, `RADIO_AGC_IIR` to false.
6. Compile gtkclient with `make clean; make`.

The RHD-headstage is now ready to be used.

------------------------------------------------------------
##Other firmwares

There are other firmware version in this directory, many of them were used in the process and developing
the final firmware.

* intan_setup_test.asm:  

    Polls the same channel from all amps, and save periods to memory starting at FP_BASE (0xFF906F00). Plot the result using plot_memdump.py (see comments in file). Used to find optimal setup for the RHD amplifiers.

    The blackfin cache memory organization can be visualized by the spreadsheet `Intan_setup.ods`

* intan_setup_test2.asm: 

    Tests the intra-amp performance. Records a set number of periods from all 32 channels of a fixed amp, save to memory in A1 (0xFF904000). Results include Intan-setup responses. Plot the result using plot_memdump.py.

    The blackfin cache memory organization can be visualized by the spreadsheet `Intan_setup.ods`

*   firmware1.asm:
   
    Integrated intan_test_setup2 into the firmware structure...after the setup process, repeatedly poll all for SPORT, but saves all channels from just one amp to WF_BUF. This allows for 256 32-bit words, which is equivalent to getting 16 samples from all 32-channels of the designated amplifier. 

    After saving the samples, part of the signal chain (AGC+IIR+SAA) was used to see how much code-path can be fit in before data corruption happens. The data in WFBUF can be dumped after it's full and plotted with plot_packet_samples.py (`plot_packet('bla.txt', 16, 32)`). Contains no radio code.

* firmware2.asm:

    Same as firmware1.asm, except the extra signal path code is replaced with nops to investiage code-length issues.

* radio_basic.asm:

    Built off firmware2.asm, but integrate in radio communication with gtkclient. The radio communication involved is a stripped-down version of the original radio protocol -- writes in the raw samples, but since no spike-sorting is done, the matching bits are simply set to 0. Instructions to add in the echo nibble and packet#-in-frame nibble are present, so gtkclient can correctly read and interpret the packet information. 
                 
    Requires uncommenting the `FIRMWARE_VERSION=RADIO_BASIC` in makefile to compile, uses the "memory_radio_basic.h" file, which describes the memory layout. The memory header file is taken care of by the Makefile. The corresponding header will be moved to be "memory.h" when the FIMRWARE_VERSION option is set.

    The blackfin cache memory organization can be visualized by the spreadsheet `radio_basic_memoryMap.ods`.

    To use with gtkclient, compile gtkclient with `RADIO_BASIC` set to true in the Makefile. 

    While running gtkclient, since no matches are actually made, in the spike-window, the waveforms may be colored blue and messages in stdin about false-positivies can happen. This is normal and safe to ignore.

* radio_AGC.asm:

    Built off radio_basic.asm, but with added AGC functions. Same radio-communication protocol as in radio_basic. Compile with `FIMRWARE_VERSION=RADIO_AGC`, use "memory_AGC.h". 

    The blackfin cache memory organization can be visualized by the spreadsheet `radio_AGC_memoryMap.ods`.

    To use with gtkclient, compile gtkclient with `RADIO_AGC` set to true in its Makefile. Same spike false-positives will occur.

* radio_AGC_IIR.asm:

    Built off radio_AGC.asm, but added two IIR biquads to act as band-pass filter, set to [500, 9000Hz]. Compile with `FIMRWARE_VERSION=RADIO_AGC_IIR`, use "memory_AGC_IIR.h".

    The blackfin cache memory organization can be visualized by the spreadsheet `radio_AGC_IIR_memoryMap.ods`.

    To use with gtkclient, compile gtkclient with `RADIO_AGC_IIR` set to true in its Makefile. Same spike false-positives will occur.
                   
    Note that unlike the original gtkclient, this version will not have an option to set the gain. This is because previously the samples were 12-bits, with Q16 values, the IIR may adjust its coefficients to apply a gain of up to 2 on its incoming samples, this is the mechanism through which Tim's gtkclient applies the gain. In the RHD version of headstage, the incoming samples are already 16-bits, therefore no gain needs/should be applied.
                   
    By changing the IIR-biquad coefficients, oscillations of different frequency may be introduced. The `osc` radio button in its version gtkclient does this. Clicking that radio button sets the IIR coefficients of the selected channels so the final IIR outputs oscilate at 919Hz. Clicking the `500-9000Hz` radio button restores the bandpass filtering behavior on the selected channels. This may serve as a good test for radio operation.

* IIR_oscillator_test.asm: 
   
    Used to test IIR-based oscillator. Basically is radio_AGC_IIR.asm without the radio transmission code in the main thread, or the radio_loop code. Sets up initial conditions on the biquads and their coefficients. 
                        
    Save 68 samples each for 32 channels on a single amp (or different, can be changed in code) to memory at 0xff806300. JTAG running and dumping the memory can visualize the resulting waveform. Visualize using plot_memdump.py, `within_amp()` or `within_amp_32ch()`. Used to confirm the biquad oscillation coefficients.

* radio_AGC_IIR_SAA.asm:   

     Adding the spike-sorting using SAA instructions to radio_AGC_IIR.asm. This is the final firmware for RHD headstages. Compile with `FIRMWARE_VERSION=RADIO_AGC_IIR_SAA`, uses "memory_AGC_IIR_SAA.h". 

     The blackfin cache memory organization can be visualized by the spreadsheet `radio_all_memoryMap.ods`.

    Compile gtkclient with `RADIO_AGC_IIR_SAA` set to true in its Makefile.

##JTAG testing

Both RHD and RHA headstages have JTAG connectors that allows for in-circuit debugging. Documented here are the procedures for using the [gnICE debugger](https://docs.blackfin.uclinux.org/doku.php?id=hw:jtag:gnice-plus). 

After flasing the firmware you want to test onto the headstage, connect the headstage to the bridge as below:

[insert picture]

Connect gnICE from PC to the bridge as below:

[Insert picture]

Turn on the bridge, in one terminal, type `bfin-gdbproxy -q bfin`, on successful detection of the debugger, the following message would appear:

```
Found USB cable: gnICE
Connected to libftdi driver.
IR length: 5
Chain length: 1
Device Id: 01100010011110100101000011001011 (0x627A50CB)
  Manufacturer: Analog Devices, Inc. (0x0CB)
  Part(0):      BF533 (0x27A5)
  Stepping:     6
  Filename:     /opt/uClinux/bfin-elf/bin/../share/urjtag/analog/bf533/bf533
warning:   bfin: no board selected, BF533 is detected
notice:    bfin: jc: waiting on TCP port 2001
notice:    bfin: jc:  (you must connect GDB before using jtag console)
notice:    bfin-gdbproxy: waiting on TCP port 2000
```
failed message such as:

```
Found USB cable: gnICE
Connected to libftdi driver.
warning: TDO seems to be stuck at 1
error:     bfin: detecting parts failed
Found USB cable: gnICE
error: Couldn't connect to suitable USB device.
error:     bfin: cable initialization failed
Found USB cable: gnICE
error: Couldn't connect to suitable USB device.
error:     bfin: cable initialization failed
```
Usually means the headstage-to-bridge JTAG connection is incorrect, or the bridge is not powered on.

After gnICE is detected, there are two ways to start a gdb debugging session. The first way is from terminal, do `bfin-elf-gdb stage.dxe`. Then in the `bfin-elf-gdb` prompt, type `target remote :2000` to connect to the gnICE. Successful connection would result in the following message in the gnICE terminal:

```
notice:    bfin-gdbproxy: connected
```

The graphical debugger [Insight](https://www.sourceware.org/insight/) can also be used, and is recommended. A good manual for using Insight with blackfin can be found in section5.ch's [IceBear](http://www.section5.ch/dsp/icebear/ICEbear-manual.pdf) manual. IceBear is an alternative in-circuit emulator(ICE)/debugger for the blackfin, but has been discontinued.

To launch Insight, type `bfin-elf-insight stage.dxe`, should be able to connect to bfin-gdbproxy automatically. If not, in `File`->`Target Setting` chose the option `GDBServer/TCP` and for port enter `2000`.

As of version6.6, Insight may pop messages asking whether you want to set up breakpoints on future library load, click `no`. Error message saying `error: bad text index "4"` can also be safely ignored by clicking `ok`.

**Example JTAG session using firmware1.asm**






##Utility Programs

* plot_memdump.py

    This program contains 
 

* plot_packet_samples.py

* fixedPointConvert.py

* AGC_sim.py

* calc_memoryAddr.py





* writeMemoryMap.py