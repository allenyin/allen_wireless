#Wireless Neural Recording System

* [Overview](#Overview)
* [Hardware](#Hardware)
	* [Steps to convert old KiCad design files](#convertKiCad)
	* [Bridge](#Bridge-hw)
	* [Headstages](#headstages)
		Overview of everything
		* [RHA-headstage](#RHA-hw)
		* [RHD-headstage](#RHD-hw)
* [Firmware](#Firmware)
	Everything needs to be flashed! Flashing is writing new firmware to the flash memory, which is loaded when blackfin is powered on and booted up. See corresponding sections.
	* [Dependency](#Firmware-dependency)
	Pyparallel, blackfin baremetal toolchain, etc.
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

##<a name="Overview">Overview</a>
This project is modified from the multi-branch of the wireless neural recording system of the [myopen project](https://github.com/tlh24/myopen/tree/multi) by Tim Hanson.

As summarized in Hanson's [thesis](http://m8ta.com/tim/dissertation.pdf), the original system 

>consists of digitizing headstages, receiver/ethernet bridge, and PC client software. Each headstage has 4 32-channel Intan analog amplifiers, and ADCs to digitize the amplified signals. The amplifiers are connected to an onboard Blackfin DSP BF532 which performs automatic gain control, LMS adaptive noise cancellation, 8 poles of high and lowpass filtering, two templates comparison per channel, data compression, and pipelined radio control. The radio onboard transmits 1.3Mbps full filtered analog trace of four channels and threshold/template match for two units on all 128 channels. This is interleaved with 83kbps reception,which allows the client to edit parameters on the transceiver. The radio protocol allows any memory location to be changed on the headstage (specifically the blackfin), and the headstage streams can stream from any location in memory, with the memory address set by the PC client.

[32-channel Intan analog amplifiers](http://intantech.com/products_RHA2000.html)

[Blackin DSP BF532](http://www.analog.com/en/products/processors-dsp/blackfin/adsp-bf532.html)

The bridge, which is based around [Blackfin DSP BF537](http://www.analog.com/en/products/processors-dsp/blackfin/adsp-bf537.html), collects the wirelessly transmitted data from the headstages and send them to the PC client through ethernet.

This project modified the wireless headstage by replacing each of the 4 RHA2132 amplifiers, ADCs, and power converter chips with a single [32-channel RHD2132 digitizing amplifier](http://intantech.com/products_RHD2000.html). This is to reduce the power consumption and total area of the final PCB (by about 1/3). In the rest of this document, the original headstages will be refered to as **RHA-headstage**, while the new design will be referred to as **RHD-headstage**. The client software will be referred to as **gtkclient**.

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

Bridge is a bridge

###<a name="headstages">Headstages</a>
All the same, except for some chips

####<a name="RHA-hw">RHA-headstage</a>
Blablabla, nothing much, read thesis

####<a name="RHD-hw">RHD-headstage</a>
There are some replacement parts.

###<a name="Firmware">Firmware</a>
Firmware is so much code!

####<a name="Firmware-dependency">Dependency</a>
bfin-elf toolchain, assembly, gcc, pyparallel, libparapin, parallel port.
Talk about the flasher!

####<a name="Bridge-fw">Bridge</a>
How to flash bridge??

####<a name="RHA-fw">RHA-headstage</a>
How to flash?

####<a name="RHD-fw">RHD-headstage</a>
Flashing depends on firmware version

#####<a name="firmware-versions">Firmware versions</a>
all that shiiiiet

#####<a name="JTAG-testing">JTAG testing</a>
Dependency

pictures and thangs! DAAAAAMN

#####<a name="Utility-programs">Utility Programs</a>
All dat python in your pants! what do they do?? Demo one up with JTAG!

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
