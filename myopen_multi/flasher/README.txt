flash.c:

    You need to have libparapin installed to make this work. 
    http://parapin.sourceforge.net/
    connections for making a cable: see flash.c
    note: need a 33pf capacitor between clock signal and ground 
    close to flash ram for proper timing. 

    Makefile is used to compile this program. To program the flash memory onboard either the
    headstage or bridge, in their respective firmware directory do:

    For bridges:

    1) "make clean"
    If using multiple bridges, make sure the mac addresses are different in: ethernet.c, SetupMacAddr(), need to increment index[5] (hex format).
    2) Turn bridge on
    3) "make flash"

    For headstages:

    1) "make clean"
    2) "make flash"
    In order to change the radio unit channel, search for radio_init() in the firmware file, main.c
    Also need to update the client, "gtkclient.cpp" to the channel set in the radio unit (g_RadioChannel). Less than 104 interferes with WiFi.

flash.py:
    
    libparapin doesn't seem to be working for Ubuntu-14.04. The last versio of the library was written for kernel-version 2.6.
    This version interfaces with the parallel port using the PyParallel library:
        http://pyserial.sourceforge.net/pyparallel.html
    Good examples of using this library can be found at:
        http://www.bristolwatch.com/pport/pportbits.htm
    
    The python script is a port of flash.c with minimal changes. Only tested for SST25 flash, however. 
    Makefiles in the firmware directories are changed so "make flash" calls the python script instead.

    The flashing procedures stay the same.
