**gtkclient: PC client to use with RHA and RHD-based wireless headstages**

In Makefile, there are several options that you can change, depending on what version of
headstage and what version of firmware is on those headstages.

Among the options `HEADSTAGE_TIM`, `RADIO_BASIC`, `RADIO_AGC`, `RADIO_AGC_IIR`, `RADIO_AGC_IIR_SAA`, only one should be set to true, with the rest to false.

**RHA-based headstages**

To compile gtkclient to use with older, RHA-based wireless headstages, set `HEADSTAGE_TIM` to true in the Makefile. 

Make sure the RHA-headstage is loaded with firmware from `../headstage_firmware` with command:
  `make clean; make; make flash`. See the comments in its Makefile if error occurs during the flashing process.

gtkclient itself is compiled with `make clean; make`.

**RHD-based headstages**

The options `RADIO_BASIC`, `RADIO_AGC`, `RADIO_AGC_IIR` and `RADIO_AGC_IIR_SAA` will compile gtkclient for testing the RHD-wireless headstages with different firmware versions. See headstage2_firmware's README for details.

The option `RADIO_AGC_IIR_SAA` should be set to compile gtkclient to use with the deployment firmware version for RHD-headstages.

**Saving sorting parameters and headstage configurations**

Instances of gtkclient saves information about its state via [protobuf](https://developers.google.com/protocol-buffers/docs/cpptutorial) in two binary files: `state.bin` and `configuration.bin`.

Upon launching, gtkclient looks for these two files. Sorted spike templates, channel threshold, signal chain settings and radio channel information settings are all saved in `configuration.bin`. If these files do not exist when gtkclient is launched, they will be created.

It's important to remember that the session's settings will only be saved at the end if gtkclient is terminated by clicking the 'x' button on the GUI. Forced termination using `ctrl-c` will result in losing these setting information.

If you want to use the sorted templates created from a different gtkclient instance (from another computer or in a different folder), simply copy the `configuration.bin` from that instance to the current gtkclient directory. Upon launching, the copied over `configuration.bin` file will be read instead. You might want to back up the replaced file for later.

**Converting configuration files between RHA- and RHD- based headstages**

Looking at the top-side (side of the board with the most components) of both headstages, channel numbers increment from left to right -- channel [0-31] correspond to the leftmost connector, channel [32-63] to the second leftmost, channel [64-95] to the third from the left, and channel [96-127] to the rightmost connector.

The order sampled by the Intan amplifiers within each group of 32 channels differe between the two headstages due to electrode routing difference in the hardware design. The following table document how channels correspond within a group of 32 channels:

RHA channel | RHD channel
------------------|-------------------
0   | 7
1   | 6
2   | 5
3   | 4
4   | 3
5   | 2
6   | 1
7   | 0
8   | 31
9   | 30
10 | 29
11 | 28
12 | 27
13 | 26
14 | 25
15 | 24
16 | 8
17 | 9
18 | 10
19 | 11
20 | 12
21 | 13
22 | 14
23 | 15
24 | 16
25 | 17
26 | 18
27 | 19
28 | 20
29 | 21
30 | 22
31 | 23

Therefore, a `configuration.bin` created by gtkclient (compiled with `HEADSTAGE_TIM` flag) talking to RHA-headstages will not work properly with RHD-headstages talking to `RADIO_AGC_IIR_SAA`-compiled gtkclient. For example, the sorted template corresponding to channel 0 on the RHA-headstage will also be read by the RHD-gtkclient to be the channel 0 template, even though it should have been the template for channel 24 since RHD-headstages is used.

This problem can be taken care of running `convertConfig` utility on the `configuration.bin` files.

Suppose a `configuration.bin` file is created by RHA-gtkclient talking to RHA-headstages. To reuse the template settings with RHD-gtkclient talking to RHD-headstages:

1. Compiling `convertConfig`. The program is compiled along with gtkclient when running `make clean; make`. But can also be remade with `rm convertConfig; make convertConfig`.

2. Run `./convertConfig RHA2RHD configuration.bin configuration.bin.RHD` to convert `configuration.bin` to RHD format, and save as `configuration.bin.RHD`.

The opposite could be done with `./convertConfig RHD2RHA configuration.bin.RHD configuration.bin.RHA`. 

*Edit 1/21/2016* : The converted templates will not readily work with the other set of headstages. This is because the templates were created on the results of each headstage's signal chain, and the RHA signal chain has more stages than RHD signal chain. Therefore, some adjustment -- AGC target, threshold level and centering point would have to be adjusted. Since these procedures would have to be done for all channels, one might as well just resort. Therefore using converted templates is not recommended. Instead, **Don't mix the usage of the different headstages** for experiments.


