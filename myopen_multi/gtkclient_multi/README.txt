Sorted spike templates are saved in configuration.bin. Note that these templates will only be 
saved if gtkclient is terminated by closing the GUI by clicking the "x" button. Using ctrl-c
will result in losing the newly sorted templates.

When gtkclient is compiled on a new system, upon launching it looks for configuration.bin, which
includes, among many things, sorted spike templates. If a configuration.bin does not exist, it
will create one on closing, including any sorted spike templates during that session.

If you want to use existing sorted templates from a different gtkclient (from another computer
or in a different folder), copy the configuration.bin file from that gtkclient to the current
gtklcient folder. Upon launching, the existing configuration.bin file will be read instead.

---------------------------------------------------------------------------------------------
To use with older, RHA-based wireless headstages, set "HEADSTAGE_TIM" to true in Makefile.
To use with the different RHD-based headstage firmware, set the corresponding directive to true
in Makefile (see "headstage2_firmware/README.txt" for details).
