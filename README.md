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
    
    TODO: Sync the firmware with the ones in Rabbit, which are actually used to flash the hardware. Sync the gtkclient_multi with that in the wheelchair room, and write up instructions of limiting the number of threads to be the same as the number of headstages/bridges been used.

---
##Steps to port old kicad projects

The recent changes in KiCad's EESchema introduces some problems in using projects created with older version out of the box. Those impacting include:

0. Updated device library. The new device library footprints are smaller, this can cause older schematics to be displayed with broken connections. Solution: follow the procedures outlined [here](https://lists.launchpad.net/kicad-developers/msg17639.html) to use the rescue-lib.
0. Saving the old .brd files will convert them to .kicad_pcb. Subsequent openning of the board files will then result in parse errors and no board. Solution: Never save!!! (have not yet found a good solution).

In general, the KiCad files in bridge_hardware and headstage_hardware are for reference only, no save/modification should be needed.

The following steps were used to convert the old project files (example using headstage_hardware/):

0. Extract stage9 from /emg_dsp.
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
0. Again remeber to **Not save the board file!!**
0. Open the schematic file and run Cvpcb to associate the components and the footprints in our own custom libraries. It's possible that a footprint is found in multiple libraries, chose to associate with the ones in *headstage*.
