#Wireless Neural Recording System

* [Overview](#Overview)
* [Hardware](#Hardware)
	* [Steps to convert old KiCad design files](#convertKiCad)
	* [Bridge](#Bridge-hw)
	* [Headstages](#headstages)
* [Firmware](#Firmware)
	Everything needs to be flashed! Flashing is writing new firmware to the flash memory, which is loaded when blackfin is powered on and booted up. See corresponding sections.
	* [Dependency](#Firmware-dependency)
	* [Bridge](#Bridge-fw)
	* [RHA-headstage](#RHA-fw)
	* [RHD-headstage](#RHD-fw)
		* [Firmware versions](#firmware-versions)
		* [JTAG testing](#JTAG-testing)
		* [Utility Programs](#Utility-programs)
* [Client Software](#gtkclient)
	* [Dependency](#gtkclient-dependency)
    Section about protobufs
	* [Compilation](#gtkclient-compile)
	Compilation of different versions, their options, screenshots, usage (match radio channel numbers).
	* [Configuration files](#gtkclient-configuration)
	* [TODO/possible improvements](#gtkclient-TODO)
	Threads, headstage.cpp, channels.h, protobufs.
* [Quick Start](#quickstart)

##<a name="Overview">Overview</a>
This project is modified from the multi-branch of the wireless neural recording system of the [myopen project](https://github.com/tlh24/myopen/tree/multi) by Tim Hanson.

As summarized in Hanson's [thesis](http://m8ta.com/tim/dissertation.pdf), the original system 

>consists of digitizing headstages, receiver/ethernet bridge, and PC client software. Each headstage has 4 32-channel Intan analog amplifiers, and ADCs to digitize the amplified signals. The amplifiers are connected to an onboard Blackfin DSP BF532 which performs automatic gain control, LMS adaptive noise cancellation, 8 poles of high and lowpass filtering, two templates comparison per channel, data compression, and pipelined radio control. The radio onboard transmits 1.3Mbps full filtered analog trace of four channels and threshold/template match for two units on all 128 channels. This is interleaved with 83kbps reception,which allows the client to edit parameters on the transceiver. The radio protocol allows any memory location to be changed on the headstage (specifically the blackfin), and the headstage streams can stream from any location in memory, with the memory address set by the PC client.

[32-channel Intan analog amplifiers](http://intantech.com/products_RHA2000.html)

[Blackin DSP BF532](http://www.analog.com/en/products/processors-dsp/blackfin/adsp-bf532.html)

The bridge, which is based around [Blackfin DSP BF537](http://www.analog.com/en/products/processors-dsp/blackfin/adsp-bf537.html), collects the wirelessly transmitted data from the headstages and send them to the PC client through ethernet.

<a name="figure_overview">*System overview, from Hanson's [thesis](http://m8ta.com/tim/dissertation.pdf)*</a>
![Hanson_Overview](https://github.com/allenyin/allen_wireless/raw/master/images/overview.png  "Hanson_Overview")

This project modified the wireless headstage by replacing each of the 4 RHA2132 amplifiers, ADCs, and power converter chips with a single [32-channel RHD2132 digitizing amplifier](http://intantech.com/products_RHD2000.html). This is to reduce the power consumption and total area of the final PCB (by about 1/3). In terms of the figure above, this is equivalent of replacing the `G=200 and 32:1 multiplexer`, `ADC` and `LDO` components in the `Digitizing headstage` blocks by one component. 

In the rest of this document, the original headstages will be refered to as **RHA-headstage**, while the new design will be referred to as **RHD-headstage**. The client software will be referred to as **gtkclient**.

This document will describe:

* The overall hardware architecture of the headstages.
* Usage and setup for the bridge, headstage, and the PC client software.
* The different firmware versions used to develop and test the RHD-headstage.
* Debugging tools.

For technical details on the implementation of the firmware and , see Tim's thesis, and:

1. [Blackfin communication with Intan RHD2132 via SPI simulation](http://allenyin.github.io/reading_list/2015/12/Blackfin-Intan-SPORT/)...Intan setup (including code)
2. [Automatic Gain Control (AGC)](http://allenyin.github.io/reading_list/2015/12/WirelessAGC/)
3. [Imiplementing direct-form I biquad IIR filters](http://allenyin.github.io/reading_list/2016/01/DirectFormI-IIR-butterworth-filters/)
4. IIR oscillator.
5. Debugging radio transmission -- incoming/outgoing packet structure, packet assembly
7. gtkclient architecture...how does it work? Threads, channels, protobufs.

This repository contains the following folders:

* `bridge_hardware`: Ported from myopen's [stage10](https://github.com/tlh24/myopen/tree/master/emg_dsp/stage10). Components  stored in `bridge_library/`. Footprint archived to `bridge_library.pretty/` to use with newer version of `kicad (Version:0.201506030104+5696~23~ubuntu14.04.1-product,release build)`.

* `headstage_hardware`: Ported from myopen's [stage9](https://github.com/tlh24/myopen/tree/master/emg_dsp/stage9). Components stored in `headstage_library/`. Footprint archived to `headstage_library.pretty/` to use with newer version of kicad.

* `headstage2_hardware`: Modified from myopen's [stage9](https://github.com/tlh24/myopen/tree/master/emg_dsp/stage9). Uses 4xRHD2132 amplifiers rather than 4xRHA2132 amplifiers front-end. Eliminated separate ADCs and analog power-supply components.

* `myopen_multi`: Firmware and gtkclient software, which includes:
    * `bridge_firmware`: Same as myopen's [firmware_stage7](https://github.com/tlh24/myopen/tree/mutli/firmware_stage7).
    * `headstage_firmware`: Firmware for RHA-headstage. Port from myopen's [firmware_stage9_tmpl](https://github.com/tlh24/myopen/tree/multi/firmware_stage9_tmpl). Uses templates matching to transmit spike timings from the headstage.
    * `headstage2_firmware`: Firmware, development and debugging files for RHD-headstage.
    * `gtkclient_multi`: gtkclient source code adapted from myopen. Makefile modified to compile on Ubuntu14.04 and to support working with RHD-headstage's firmware.
    * `flasher`: Code used to write to the flash memories of the bridge and headstage through the parallel port.
    * `common_bfin`: Code common to all firmware and gtkclient.
    * `common_host`: Code common to the bridge firmware and gtkclient.
    * `algs`: Utilities need by gtkclient.
    
---
##<a name="Hardware">Hardware</a>

###<a name="convertKiCad">Steps to convert old KiCad design files</a>
The bridge and RHA-headstage PCB were designed with Tim's [kicadocaml](https://github.com/tlh24/kicadocaml), a variant of the opensource [KiCad](http://kicad-pcb.org/) PCB cad program. The design files were ported to KiCad, however the recent changes in KiCad's EESchema introduces some problems in using projects created with older version out of the box. Those impacts include:

0. Updated device library. The new device library footprints are smaller, this can cause older schematics to be displayed with broken connections. Solution: follow the procedures outlined [here](https://lists.launchpad.net/kicad-developers/msg17639.html) to use the rescue-lib.
0. Saving the old .brd files will convert them to .kicad_pcb. Subsequent openning of the board files will then result in parse errors and no board. Solution: Never save!!! (have not yet found a good solution).

In general, the KiCad files in `bridge_hardware/` and `headstage_hardware/` are for reference only, no save/modification should be needed.

The following steps were used to convert the old project files (example using `headstage_hardware/`):

0. Extract stage9 from `/emg_dsp`.
0. Create component and footprint library folders. `cd headstage_hardware; mkdir headstage_library headstage_library.pretty`
0. Open the schematic file, press OK for the rescue components dialog. Copy the cached component to our newly created library: `cp stage9-cache.lib headstage_library/headstage.lib`
0. Go to *Preferences*->*Component Libraries* and add headstage as an active library.
0. Ctrl-E on any of the component to open library editor. Set active library to be *headstage* and save component.
0. Close schematic and open again. Now editing any of the components in the library editor should show the active library as *headstage.lib*
0.  **Important! When closing the schematic, do not click on save!**
0. Open the .brd file, click ok on the resulting dialog.
0. Ctrl-E on any of the footprint to open the footprint editor. Click on *Create new library and save footprint* from the menu bar, and select the *headstage_library.pretty* folder to store the new library.
0. Go to *Preferences*->*Footprint libraries Wizard*->*Files on my computer* and select the *headstage_library.pretty* folder. This will add that directory to the footpring libraries available in this project. Make sure to select avaliable to project only.
0. *Select active library* in the footprint editor and make it *headstage_library.pretty*.
0. Close footprint editor and go back to the board. Go to *file*->*Archive Footprints*->*Create footprint archive* and select *headstage_library.pretty* as the library. Click yes to replace library. Now *headstage_library.pretty/* contains all the footprint used in the board as .mod files.
0. Make sure when footprint editor is opened, the active library is set correctly to the one we just created.
0. Again remeber to **NOT save the board file!!**
0. Open the schematic file and run Cvpcb to associate the components and the footprints in our own custom libraries. It's possible that a footprint is found in multiple libraries, chose to associate with the ones in *headstage*.

###<a name="Bridge-hw">Bridge</a>
As illustrated by the [Receiver block in the system overview](#figure_overview), the bridge mainly consists of three antenna-2.4GHz radio pairs for wireless communication, Blackfin DSP for processing, Ethernet/MAC chip for communication with gtkclient, and DAC (typo of DAC in Tim's thesis) for outputting received neural signals as audio.

In addition to wireless communication with the headstages, the bridge is also needed to program and debug the headstages.

<a name="bridge_labeled">*Bridge Board* </a>

![labeled_bridge](https://github.com/allenyin/allen_wireless/raw/master/images/bridge_labeled.png  "labeled_bridge")

In the above image:

A. Power switch.

B. USB power cable. 

C. Ethernet cable. Each operating headstage requires a bridge, requiring the PC on which gtkclient operates on to be connected to multiple bridges. Therefore, the ethernet port of the bridges and the client PC should all connect to the same switch or router.

D. Audio jack. When gtkclient is running, connecting the bridge to an audio device allows the user to hear the the 4 selected channels in gtkclient.

E. Blackfin BF537 DSP processor.

F. JTAG header pins for debugging the bridge. The pin missing on the top row ensures correct orientation of the JTAG in-circuit emulator (ICE).

G. Header pins for writing firmware to the bridge's flash memory. See [bridge flashing instructions](#Bridge-fw).

H. Indicator LED lights. After power on, these LEDs would fluctuate. Normal operation is indicated by the LEDs lit up in the image lighting up. Except for the bottom most one, which should be blinking periodically.

I. Header pins for writing firmware to the headstage's flash memory. See [RHA-flashing instructions](#RHA-fw) and [RHD-flashing instructions](#RHD-fw).

J. Omnetics connector for writing firmware to the headstage's flash memory. The signals applied to the column of header pins above it are applied to the headstage through this connection to the corresponding omnetics connector on the headstage.

K. JTAG header pins for debugging the headstage. The pin missing on the left column ensures correct orientation of JTAG ICE. See [RHD firmware testing](#JTAG-testing).

L. Omnetics connector for JTAG debugging the headstage. The signals applied to the JTAG header pins are passed to the headstage through this connection.

M. 2.4GHz Nordic radio and antenna pairs. Having three antenna allow for spatial reception diversity and enable better wireless signal quality.

**Parallel Port Flash Cable**

A 25-pins [IBM PC-comptabile parallel port](https://en.wikipedia.org/wiki/Parallel_port#Pinouts) cable is modified to use for the flashing process, see [firmware section](#Firmware) for instructions.  The unmodified end of the DB25 cable is connected to the parallel port, while the modified end connects to the 7-pin header connectors on the bridge, labeled G and I above.

The flash cable on one end needs to be modified as shown below:

<a name="flash_cable">*Flash Cable Schematic*</a>![flash_cable](https://github.com/allenyin/allen_wireless/raw/master/images/flash_cable_schematic.png "flash_cable")

The left box shows the relevant pins on the unmodified DB25 connector, the right box shows the corresponding header pins on the bridge. There needs to be a `33pF` capacitor connecting `pin23` and `pin4` of the parallel cable. `pin5` of the cable needs to connect to the base of an NPN transistor, whose emmiter is connected to ground via either `pin23` or `pin24`, while the collector goes to `pin7` of the bridge headers.

Specifically, the parallel port to SPI correspondence is:

* `pin2` = `_CS` -- chip select of the SPI flash memory.
* `pin13` = `SO` -- the input of the parallel port is connected to the output (SO) of the flash memory.
* `pin3` = `SI` -- the output of the parallel port is connected to the input (SI) of the flash memory.
* `pin4` = `SCLK` -- serial clock (SCLK) of the flash memory.

`pin5` is not part of the 4-line SPI interface, but it is used to allow the line-driver onboard the bridge to select the flash memory to use the SPI bus. This is necessary since the SPI bus on the Blackfins of both the bridge and headstage is shared between the flash memory and the radio chip.

The modified flash cable will include the capacitor and the NPN transistor. The polarity of the 7-pin connector can be figured out by probing to see which pin is grounded onboard the bridge.

###<a name="headstages">Headstages</a>

In image below, the fully assembled RHA-headstage is on the left. The RHD-headstage is on the right.

<a name="headstages_labeled">*Headstage PCBs*</a>

![labeled_headstages](https://github.com/allenyin/allen_wireless/raw/master/images/headstages.png "labled_headstages")

Labeled in the image are the connectors the headstages can make:

A. RHA-headstage Omnetics connectors to electrodes. Each of the four connectors has two rows of 20 pins each. The leftmost and rightmost pins of each row are guide posts and connect no signals. The second leftmost and the second rightmost pins of each row are the reference electrodes.

B. RHA-headstage power connection to 3.7V battery.

C. RHA-headstage Omnetics connector for flashing memory. The JTAG debugging connector is on the back side of the board at the same location.

D. RHD-headstage Omnetics connectors to electrodes. Exactly the same as the RHA-headstage.

E. RHD-headstage power connection to 3.7V battery. Connection not installed in the pictre.

F. RHD-headstage Omnetics connector for flashing memory. The JTAG debugging connector is on the back side of the board at the same location.

The bottom half of both headstages are the `digitizing headstages` block in the [System overview diagram](#figure_overview), which is where the headstages differ hardware-wise. The top halves are the `transceiver block` and are identical.

###<a name="Firmware">Firmware</a>
The firmware is written in a combination of C and Blackfin assembly language. While Analog Devices (ADI) provides its own software development toolchains, it requires purchasing a pretty expensive license (though it comes with a lot more support). For the myopen and this project, the open source gnu gcc blackfin toolchain is used. Further, all development was done on debian based OS. The Makefiles in this repository are tested only in Ubuntu 14.04. Minor adjustments might be needed to work on other debian-based OS.

####<a name="Firmware-dependency">Dependency</a>

Compiling the firmware requires the [Blackfin Toolchain in Linux for Bare Metal](https://blackfin.uclinux.org/doku.php?id=toolchain:installing). For debian-based linux OS:

* Download the latest version, as of June, 2015, it's `blackfin-toolchain-elf-gcc-4.3-2014R1-RC2.x86_64.tar.bz2`
* Extract and move to `/opt`
* Add path to `/opt/uClinux/bfin-elf/bin` to the `PATH` variable through `.bashrc`

Two must-have references:

* [ADSP-BF5xx/ADSP-BF60x Blackfin Processor Programming Reference](http://www.analog.com/media/en/dsp-documentation/processor-manuals/Blackfin_pgr_rev2.2.pdf), describes all assembly commands and options.
* [ADSP-BF533 Blackfin Processor Hardware Reference](http://www.analog.com/media/en/dsp-documentation/processor-manuals/ADSP-BF533_hwr_rev3.6.pdf), describes all components and functions of the processor.  BF533 processor is mostly identical with BF532, which are the processors onboard the headstages. For the bridge, see BF537.

After compiling the firmware, the binary needs to be uploaded into the SPI flash memory onboard the bridge or headstage. This is done through a parallel port (for speed and relative ease). There are two ways this could be done.

**Using Libparapin**

In older computers with integrated parallel port (such as our lab's `rabbit` running DebianWheezy), [libparapin](http://parapin.sourceforge.net) can be installed to talk to the paralle port. This was used by Tim to develop and flash the RHA-headstages.

After installation of libparapin (in either user or kernel mode), compile `myopen_multi/flasher/flash.c` with `make clean; make`. 

With proper PC-to-bridge (and bridge-to-headstage) connections, compiled firmware binary can be uploaded with `sudo ./flash myprogram.ldr`.

**Using Pyparallel (recommended)**

Unfortunately Libparapin does not play nicely with parallel port PCI expansion cards and/or newer OS. I'm not sure what the exact culprit is, but the most recent version of libparapin is for kernel version2.6, and there hasn't been any activity on the project in several years.

Fortunately the python library [pyparallel](https://github.com/pyserial/pyparallel), allows us to interact with the parallel conveniently. Note that `pyparallel` can also refer to a Python parallel processing package. See [Lewis Loflin's blog posts](http://www.bristolwatch.com/pport/index.htm) for details on using the library.

After installing this module, firmware can be flashed with `python flash.py myprogram.ldr`. Error might occur indicating parallel port cannot be openened, in which case do `sudo rmmod lp; sudo modprobe ppdev` and try again.

Successful flash message:
```
python ../flasher/flash.py stage.ldr
ldr file: stage.ldr
File size 12202 bytes, 48 pages.

Requesting manufacturer opcode...

Read: 0xbf 

Looks like microchip flash.
Read: 0xbf 

Read: 0x25 

Read: 0x8d 

Read: 0xbf 

Detected: 
SST25VF040
SST25 sanity check ok.
Status register 0x0
Bank protect bits = read-write.
AAI off.
Block protect off.
Device is not write enabled. (default)
Device is ready.
Erasing SST25!
Waiting for the erase to complete..
Status register 0x0
Bank protect bits = read-write.
AAI off.
Block protect off.
Device is not write enabled. (default)
Device is ready.
write_all2_SST25 writing buffer length 12202
Verifying all..
 ok.

All pages verified correctly! :)
```
####<a name="Bridge-fw">Bridge</a>

The bridge firmware was not modified from the original myopen project (except the Makefile, for directory consistency). To flash the bridge, connect the flash cable to the bridge header pins as below, note the direction of cable connection is marked on the red flash cable.

<a name="Bridgeflash">*Flashing the bridge*</a>
![Bridgeflash](https://github.com/allenyin/allen_wireless/raw/master/images/Bridgeflash.jpg)

1. Go to the `myopen_multi/bridge_firmware/` directory, and do `make clean; make` to compile the firmware. 

	Note that each bridge is receives from a different headstage. Therefore, if multiple headstages are used, multiple bridges will need to be flashed and used. 

	If multiple briges are used, make sure the MAC addresses for the bridges are different. Go to `myopen_multi/common_bfin/ethernet.c`, in function `SetupMacAddr()`, change the value of `MACaddr[5]` so that the bridges used have different values.

2. Turn the bridge on, making sure the USB power cable is connected, then do `make flash`. 
 
	`make flash` will use either the libparapin based `flash.c` or pyparallel based `flash.py` to write the firmware to memory, based on what option is enabled in the Makefile under the `flash` rule. The default option will use the Python method.

####<a name="RHA-fw">RHA-headstage</a>

The RHA-headstage firmware was not modified from the original myopen project (except the Makefile, for directory consistency). To flash the heastage, connect the flash cable to the bridge header pins, and the 9-pins Omnetics cable to the bridge as shown below, note the direction of cable connection is marked on the red flash cable.

<a name="bridge_connection">*Bridge connection to flash headstage*</a>![bridge_connection](https://github.com/allenyin/allen_wireless/raw/master/images/bridge_connection.jpg)

1. Connect the other end of the 9-pins cable to the top-side omnetics connector on the headstage as shown below, note that the top wire on the bridge is also the top wire on the headstage.

	<a name="headstage_connection">*RHA-headstage connection*</a>![headstage_connection](https://github.com/allenyin/allen_wireless/raw/master/images/headstage_connection.jpg)

	Note that the RHA-headstage shown in the image is only the transceiver top half.

2. Go to the `myopen_multi/headstage_firmware/` directory, and do `make clean; make` to compile the firmware.

	Note that if multiple headstages are used, they must be configured to operate on different radio frequency. To change the radio channel, go to `myopen_multi/headstage_firmware/main.c` and search for the call to `radio_init()` and change the input argument. An input value of `84`, for example, sets the radio to operate on `2400MHz + 84Hz = 2484Mhz`. Other possible values are 94, 114, and 124. The maximum is 124. These changes must be followed by firmware recompilation.

    Theoretically, the 2.4GHz radio used onboard can operate with 2Msps on 62 different 2MHz bandwidth channels. The radio can operate from 2.4GHz to 2.525Ghz. When operating at 2Msps, each frequency requires a 2MHz bandwidth. Therefore, with no overlap, the input value to `radio_init()` can take values of 0, 2, 4,..., 124. However, the lower frequency bands are prone to attenuation by water absoprtion and interference from WiFi/Bluetooth/ZigBee bands. Therefore, the actual frequencies used should be limited to the higher bands. When multiple headstages are used, they should be set at frequencies as far apart as possible (note the separation of 10-20MHz for the values suggested).

    See [Nordic nRF24L01 manual section6.3](http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf).

3. Turn on the bridge, and flash the headstage with `make flash`. 

	`make flash` will use either the libparapin based `flash.c` or pyparallel based `flash.py` to write the firmware to memory, based on what option is enabled in the Makefile under the `flash` rule. The default option will use the Python method.

4. Modify gtkclient:
 	* Make sure in `myopen_multi/gtkclient_multi/Makefile`, the option `HEADSTAGE_TIM` is set to `TRUE`, while setting `RADIO_BASIC`, `RADIO_AGC`, `RADIO_AGC_IIR` and `RADIO_AGC_IIR_SAA` to `false`.
	* Go to `myopen_multi/gtkclient_multi/src/gtkclient.cpp` and make sure the radio channel given to `radio_init()` in the headstage's firmware is present in the array `g_radioChannel`. 
	* If using multiple headstage-bridge pairs for recording, make sure the value of `NSCALE` defined in `myopen_multi/gtkclient_multi/include/gtkclient.h` is set to the number of headstage-bridge pairs used.
   
    After all (if any) gtkclient modifications, recompile gtkclient by navigating into `myopen_multi/gtkclient_multi` and type `make clean; make`. gtkclient is now ready to be used with RHA-headstages.

When powered on, the LED onboard should blink periodically.

The file `memory_map.ods` is a spreadsheet visualizing the memory organization used in the RHA-headstage firmware.

####<a name="RHD-fw">RHD-headstage</a>

The parallel port-to-bridge connections and bridge-to-headstage connections are identical for RHD-headstage as for RHA-headstages. However, there are multiple firmwares available in the `myopen_multi/headstage2_firmware` directory. To program the RHD-headstage to use the final firmware version, navigate to that directory and:

1. Uncomment the line `FIRMWARE_VERSION=radio_AGC_IIR_SAA` line in `myopen_multi/headstage2_firmware/Makefile`.

2. Type `make clean; make` to compile the firmware.

	Note that if multiple headstages are used, they must be configured to operate on different radio frequency. To change the radio channel, go to `myopen_multi/headstage_firmware/main.c` and search for the call to `radio_init()` and change the input argument. An input value of `84`, for example, sets the radio to operate on `2400MHz + 84Hz = 2484Mhz`. Other possible values are 94, 114, and 124. The maximum is 124. These changes must be followed by firmware recompilation.

    Theoretically, the 2.4GHz radio used onboard can operate with 2Msps on 62 different 2MHz bandwidth channels. The radio can operate from 2.4GHz to 2.525Ghz. When operating at 2Msps, each frequency requires a 2MHz bandwidth. Therefore, with no overlap, the input value to `radio_init()` can take values of 0, 2, 4,..., 124. However, the lower frequency bands are prone to attenuation by water absoprtion and interference from WiFi/Bluetooth/ZigBee bands. Therefore, the actual frequencies used should be limited to the higher bands. When multiple headstages are used, they should be set at frequencies as far apart as possible (note the separation of 10-20MHz for the values suggested).
	
    See [Nordic nRF24L01 manual section6.3](http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf).

3.  Turn on the bridge and do `make flash`. 

	There should be a line in the output message that says `FIRMWARE_VERSION is RADIO_AGC_IIR_SAA`. If not, make sure again in Makefile that all other lines containing `FIMRWARE_VERSION=` is commented out.

4. Modify gtkclient:
	* Go to `myopen_multi/gtkclient_multi/Makefile` and set the option `RADIO_AGC_IIR_SAA` to true, while setting `HEADSTAGE_TIM`, `RADIO_BASIC`, `RADIO_AGC`, `RADIO_AGC_IIR` to `false`. This ensures gtkclient can correctly communicate with the RHD-headstage firmware.
	* Go to `myopen_multi/gtkclient_multi/src/gtkclient.cpp` and make sure the radio channel given to `radio_init()` in the headstage's firmware is present in the array `g_radioChannel`.
	* If using multiple headstage-bridge pairs for recording, make sure the value of `NSCALE` defined in `myopen_multi/gtkclient_multi/include/gtkclient.h` is set to the number of headstage-bridge pairs used.

	After all (if any) gtkclient modifications, recompile gtkclient inside `myopen_multi/gtkclient_multi` directory with `make clean; make` -- gtkclient is now ready to be used with RHD-headstage.

When turned on, the onboard LED should blink periodically.

####<a name="firmware-versions">Firmware versions</a>####
There are other firmware version in this directory, many of them were used in the process and developing
the final firmware.

* `intan_setup_test.asm`:  

    Polls the same channel from all 4 Intan amplifiers, and save periods to memory starting at FP_BASE (0xFF906F00). Plot the result using `plot_memdump.py`, function `within_amp()`. Used to find optimal setup for the RHD amplifiers.

    Compile and flash with `make clean; make; make flash` after uncommenting `FIRMWARE_VERSION=intan_setup_test` and commenting out all other `FIRMWARE_VERSION` comments. Does not use the radio so not supported by gtkclient.

    The blackfin cache memory organization can be visualized by the spreadsheet `Intan_setup.ods`. Memory header is `memory_RHA.h` -- identical to RHA-headstage's `memory.h` file.

* `intan_setup_test2.asm`: 

    Tests the intra-amp performance. Records a set number of periods from all 32 channels of a fixed amp (see comments in file), save to memory in A1 (0xFF904000). Results include Intan-setup responses. Use `plot_memdump.py`, function `within_amp()` to plot the results.

    Compile and flash with `make clean; make; make flash` after uncommenting `FIRMWARE_VERSION=intan_setup_test2` and commenting out all other `FIMRWARE_VERSION` comments. Does not use the radio, not supported by gtkclient.

    The blackfin cache memory organization can be visualized by the spreadsheet `Intan_setup.ods` Memory header is `memory_RHA.h` -- identical to RHA-headstage's `memory.h` file.

* `firmware1.asm`:
   
    Integrated intan_test_setup2 into the firmware structure...after the setup process, repeatedly poll all the SPORT, but saves all channels from just one amp to WF_BUF. This allows for 256 32-bit words, which is equivalent to getting 16 samples from all 32-channels of the designated amplifier. 

    After saving the samples, part of the signal chain (AGC+IIR+SAA) was used to see how much code-path can be fit in before data corruption happens. The data in WFBUF can be dumped after it's full and plotted with `plot_packet_samples.py` (`plot_packet('bla.txt', 16, 32)`). Contains no radio code. Not supported by gtkclient.

    Memory header is `memory_RHA.h` -- identical to RHA-headstage's `memory.h` file.

* `firmware2.asm`:

    Same as `firmware1.asm`, except the extra signal path code is replaced with nops to investiage code-length issues.

* `radio_basic.asm`:

    Built off firmware2.asm, but integrate in radio communication with gtkclient. The radio communication involved is a stripped-down version of the original radio protocol -- writes in the raw samples, but since no spike-sorting is done, the matching bits are simply set to 0. Instructions to add in the echo nibble and packet#-in-frame nibble are present, so gtkclient can correctly read and interpret the packet information. 
                 
    Requires uncommenting the `FIRMWARE_VERSION=RADIO_BASIC` in makefile to compile, uses the "memory_radio_basic.h" file, which describes the memory layout. The memory header file is taken care of by the Makefile. The corresponding header will be moved to be "memory.h" when the FIMRWARE_VERSION option is set.

    The blackfin cache memory organization can be visualized by the spreadsheet `radio_basic_memoryMap.ods`.

    To use with gtkclient, compile gtkclient with `RADIO_BASIC` set to true in the Makefile. 

    While running gtkclient, since no matches are actually made, in the spike-window, the waveforms may be colored blue and messages in stdin about false-positivies can happen. This is normal and safe to ignore.

* `radio_AGC.asm`:

    Built off radio_basic.asm, but with added AGC functions. Same radio-communication protocol as in radio_basic. Compile with `FIMRWARE_VERSION=RADIO_AGC`, use "memory_AGC.h". 

    The blackfin cache memory organization can be visualized by the spreadsheet `radio_AGC_memoryMap.ods`.

    To use with gtkclient, compile gtkclient with `RADIO_AGC` set to true in its Makefile. Same spike false-positives will occur.

* `radio_AGC_IIR.asm`:

    Built off radio_AGC.asm, but added two IIR biquads to act as band-pass filter, set to [500, 9000Hz]. Compile with `FIMRWARE_VERSION=RADIO_AGC_IIR`, use "memory_AGC_IIR.h".

    The blackfin cache memory organization can be visualized by the spreadsheet `radio_AGC_IIR_memoryMap.ods`.

    To use with gtkclient, compile gtkclient with `RADIO_AGC_IIR` set to true in its Makefile. Same spike false-positives will occur.
                   
    Note that unlike the original gtkclient, this version will not have an option to set the gain. This is because previously the samples were 12-bits, with Q16 values, the IIR may adjust its coefficients to apply a gain of up to 2 on its incoming samples, this is the mechanism through which Tim's gtkclient applies the gain. In the RHD version of headstage, the incoming samples are already 16-bits, therefore no gain needs/should be applied.
                   
    By changing the IIR-biquad coefficients, oscillations of different frequency may be introduced. The `osc` radio button in this version of gtkclient does this. Clicking that radio button sets the IIR coefficients of the selected channels so the final IIR outputs oscilate at 919Hz. Clicking the `500-9000Hz` radio button restores the bandpass filtering behavior on the selected channels. This may serve as a good test for radio operation.

* `IIR_oscillator_test.asm`: 
   
    Used to test IIR-based oscillator. Basically is radio_AGC_IIR.asm without the radio transmission code in the main thread, or the radio_loop code. Sets up initial conditions on the biquads and their coefficients. 
                        
    Save 68 samples each for 32 channels on a single amp (or different, can be changed in code) to memory at 0xff806300. JTAG running and dumping the memory can visualize the resulting waveform. Visualize using plot_memdump.py, `within_amp_32ch()`. Used to confirm the biquad oscillation coefficients.

* `radio_AGC_IIR_SAA.asm`:   

     Adding the spike-sorting using SAA instructions to radio_AGC_IIR.asm. This is the final firmware for RHD headstages. Compile with `FIRMWARE_VERSION=RADIO_AGC_IIR_SAA`, uses "memory_AGC_IIR_SAA.h". 

     The blackfin cache memory organization can be visualized by the spreadsheet `radio_all_memoryMap.ods`.

    Compile gtkclient with `RADIO_AGC_IIR_SAA` set to true in its Makefile.


####<a name="JTAG-testing">JTAG testing</a>
Both RHD and RHA headstages have JTAG connectors that allows for in-circuit debugging. Documented here are the procedures for using the [gnICE debugger](https://docs.blackfin.uclinux.org/doku.php?id=hw:jtag:gnice-plus). 

After flasing the firmware you want to test onto the headstage, connect the 9-pin Omnetics connector labeled L on the [bridge](#bridge_labeled) to the 9-pin Omnetics connector on the back of the headstage.

Connect gnICE from PC USB port to the JTAG header pins labeled J on the [bridge](#bridge_labeled).

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
Debugging is then identical to using gdb.

The graphical debugger [Insight](https://www.sourceware.org/insight/) can also be used, and is recommended. A good manual for using Insight with blackfin can be found in section5.ch's [IceBear](http://www.section5.ch/dsp/icebear/ICEbear-manual.pdf) manual. IceBear is an alternative in-circuit emulator(ICE)/debugger for the blackfin, but has been discontinued.

To launch Insight, type `bfin-elf-insight stage.dxe`, should be able to connect to bfin-gdbproxy automatically. If not, in `File`->`Target Setting` chose the option `GDBServer/TCP` and for port enter `2000`.

As of version6.6, Insight may pop messages asking whether you want to set up breakpoints on future library load, click `no`. Error message saying `error: bad text index "4"` can also be safely ignored by clicking `ok`.

#####<a name="Utility-programs">Utility Programs</a>

`myopen_multi/headstage2_firmware` also includes a number of utility programs used in the development and debugging process:

* `plot_memdump.py`, requires matplotlib, numpy and scipy.

    In JTAG debugging, memory values can be dumped when execution is paused. These values can then be processed and plotted. For example, while using `intan_setup_test2.asm`, with the following preprocessor setup:

    ```
    #define TESTFREQ                3200 // Hz
    #define STORAGE                 2480
    #define SAMPLE_PER_CH           150
    #define SAMPLE_PER_CH_MINUS_3   147
    #define TOTAL_CONVERT           4800   // 32*SAMPLE_PER_CH
    #define TOTAL_CONVERT_MINUS_3   4797
    ```

    and the subroutine `save_one_amp` as:
    
    ```
    save_one_amp:
        r1 = w[p0 + (SPORT1_STAT - SPORT0_RX)];
        cc = bittst(r1, 0);
        if !cc jump save_one_amp;

        // save new samples, in order from amp1 to amp4
        r2 = [p0 + (SPORT1_RX - SPORT0_RX)];    // SPORT1 pri - 2nd amp
        r3 = [p0 + (SPORT1_RX - SPORT0_RX)];    // SPORT1 sec - 1st amp
        r2 >>= SHIFT_BITS;
        r3 >>= SHIFT_BITS;
        //w[p1++] = r3;                           // save 1st amp
        //w[p1++] = r2;                           // save 2nd amp

        r2 = [p0];                              // SPORT0 pri - 4th amp
        r3 = [p0];                              // SPORT0 sec - 3rd amp
        r2 >>= SHIFT_BITS;                      
        r3 >>= SHIFT_BITS;
        w[p1++] = r3;                           // save 3rd amp
        //w[p1++] = r2;                           // save 4th amp
        rts;
    ```

    and setting a breakpoint at the line `jump we_finished`, when the execution is paused, we will have recorded 2472 32-bit words starting from memory location `A1` with the address `0xFF904000`. If we were applying a 3200Hz wave to some of the third group of electrodes, that would mean we have recorded 15 periods of that signal.

    In the gdb prompt of Insight debugger (or just the regular gdb prompt), we can dump the recorded signals (in addition to other setup values, see comments) to `gdb.txt` by:

    ```
    set logging redirect on
    set logging on
    x/2480xw 0xFF904000
    set logging off
    ```

    We can then plot the recorded values from all 32 channels of the 3rd group of electrodes in iPython with functions defined in this script:

    ```
    %run plot_memdump.py
    data = within_amp('gdb.txt', 32, 3200, 15)
    ```

    Below on the right is the plot result. Only 4 channels are actually applied the signal, the rest are grounded.

    <a name="JTAG1">*Using plot_memdump.py with intan_setup_test2*</a>
    
    ![JTAG1](https://github.com/allenyin/allen_wireless/raw/master/images/plot_memdump_intan_setup_test2.png)

    Use the function `within_amp_32ch()` for use with `IIR_oscillator_test.asm`.

    The function `saveCh_to_mat()` can convert the dumped gdb values as mat files, which can be imported into Matlab for analysis.

* `plot_packet_samples.py`

    Used with `firmware1.asm` and `firmware2.asm`. Saves samples from all 128 channels to WF_BUF, starting at memory location 0xff804000. Breakpoint should be set at `jump we_finished` in both files. At the end of execution, 256 32-bit words would be saved.

    The dumped values can then be plotted by `plot_packet_allChannels('gdb.txt')`.

* `fixedPointConvert.py`, `AGC_sim.py` contains functions that simulate the fixed-point conversion and arithmetic operations on Blackfin. 

    `AGC_sim.py` also contains simulates the AGC algorithm used in the headstage signal chain (see [AGC article](http://allenyin.github.io/reading_list/2015/12/WirelessAGC/) for details). Sample outputs of `AGC_sim.py` in iPython can be found in `AGC_sim_examples.txt`.

* `calc_memoryAddr.py` is used to confirm that given the different firmware version's memory file, gtkclient will be able to correctly calculate the relevant memory addresses.

    Even though all firmware is compiled with `memory.h`, it is actually a copy of either `memory_RHA.h`, `memory_radio_basic.h`, `memory_radio_AGC.h`, `memory_radio_AGC_IIR.h` or `memory_radio_AGC_IIR_SAA.h`. For example, to change the AGC target of a specific channel, the memory address to write the new value to in headstage running `radio_AGC.asm` is different from that running `radio_AGC_IIR.asm`. These memory address is calculated by gtkclient (specifically, in `myopen_multi/gtkclient_multi/src/headstage.cpp`) from the `memory.h` file generated by `headstage2_firmware/Makefile`.

    To use `calc_memoryAddr.py`, change the variables defined in the beginning of the file to match the corresponding firmware memory header file. Then run `setAGC(15)` for example to calculate what address gtkclient would output for changing the AGC target of channel 15. That address can then be verified against the `radio_AGC_memoryMap.ods`, for example, in the case of testing `radio_AGC.asm`.


##<a name="gtkclient">Client Software</a>

###<a name="gtkclient-dependency">Dependency</a>
All the deps in makefile, nvidia graphics card? protobuf. Make deps should be ok. Debian or Ubuntu14.04

###<a name="gtkclient-compile">Compilation</a>
Match radio channel numbers!!!
Compile for RHA
Compile for RHD, different versions, so we can use for both!
Screenshots! HOw do they work?

###<a name="gtkclient-configuration">Configuration files</a>
What I changed...how does it work? Instructions on templates and why not to mix RHA and RHD.

###<a name="gtkclient-TODO">TODO/possible improvements</a>
More threadsafe? Redsicovery of bridges? Spatial bridge redundancy to improve range? Graphics improvements --opengl??

##<a name="Quick Start">Quick Start</a>
