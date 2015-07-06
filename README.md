#allen_wireless

Modified from the wireless neural recording parts of the [myopen project](https://github.com/tlh24/myopen) by Tim Hanson.

Folders:

* bridge_hardware: port from [stage10](https://github.com/tlh24/myopen/tree/master/emg_dsp/stage10). Components  stored in bridge_library/. Footprint archived to bridge_library.pretty/ to use with newer version of kicad (Version:0.201506030104+5696~23~ubuntu14.04.1-product,release build).
* headstage_hardware: port from [stage9](https://github.com/tlh24/myopen/tree/master/emg_dsp/stage9). Components stored in headstage_library/. Footprint archived to headstage_library.pretty/ to use with newer version of kicad.
* headstage2_hardware: based on stage9. Uses 4xRHD2132 amplifiers rather than 4xRHA2132 amplifiers front-end. Eliminated separate ADCs and analog power-supply components.
* myopen_multi: Modified from [myopen's multi branch](https://github.com/tlh24/myopen/tree/multi). Includes:
    * bridge_firmware: previously [firmware_stage7](https://github.com/tlh24/myopen/tree/mutli/firmware_stage7).
    * headstage_firmware: previously [firmware_stage9_tmpl](https://github.com/tlh24/myopen/tree/multi/firmware_stage9_tmpl). Uses templates matching to transmit spike timings from the headstage.
    * gtkclient_multi: The wireless gtkclient. Makefile modified to compile on Ubuntu. Need to recompile for newer protobuf versions.
    * flasher: Code used to write to the flash memories of the bridge and headstage, see Instructions in crispy.
    * common_bfin: Common blackfin files.
    * common_host: Files for bridge.
    TODO: Sync the firmware with the ones in Rabbit, which are actually used to flash the hardware. Sync the gtkclient_multi with that in the wheelchair room.
