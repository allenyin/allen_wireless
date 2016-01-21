#Firmware for wireless headstage bridge

The bridge units are the same, regardless of the headstages used -- either the older, RHA-based headstages (Tim Hanson's myopen project), or my RHD-based headstages.

**Flashing Instructions**

1. Using flashing cable (red in picture below) plugged into the computer's parallel port, plug into the bridge's SPI port as illustrated.
![bridge connection](/home/allenyin/allen_wireless/myopen_multi/bridge_firmware/Bridgeflash.jpg  "bridge connection")

2. If using multiple bridges at the same time, make sure the MAC addresses for the bridges are different. Go to `../common_bfin/ethernet.c`, in function `SetupMacAddr()`, change the value of `MACaddr[5]`.

3. Turn the bridge on (make sure the USB power cable is connected).

4. `make clean; make; make flash`
	If error occurs, try `sudo rmmod lp; sudo modprobe ppdev` to allow pyparallel access to the paralle port.