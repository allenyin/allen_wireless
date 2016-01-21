#Firmware for RHA-based wireless headstages (from Tim Hanson's myopen project)

**Flashing Instructions**

1. Connect the flashing cable (plugged into the computer's parallel port) into the bridge as below:
![bridge_connection](/home/allenyin/allen_wireless/myopen_multi/headstage_firmware/bridge_connection.jpg  "bridge_connection")

2. Connect the omnetics cable from the bridge to the headstage as below:
![headstage_connection](/home/allenyin/allen_wireless/myopen_multi/headstage_firmware/headstage_connection.jpg  "headstage_connection")

3. In order to change the radio channel (10 are available for the Nordic radio chip), go to `main.c` and search for `radio_init()` and change the input value.

	You'll also need to update the client - `gtkclient.cpp` so that the channel set in the radio unit is the same as values in `g_radioChannel` array.

4. Run `make clean; make; make flash`