# Makefile for  program running in L1 memory
.SUFFIXES: .o .c .asm .bo .asm

#FIRMWARE_VERSION = firmware1
#FIRMWARE_VERSION = firmware2
#FIRMWARE_VERSION = intan_setup_test
FIRMWARE_VERSION = intan_setup_test2
#FIRMWARE_VERSION = radio_basic
#FIRMWARE_VERSION = radio_AGC
#FIRMWARE_VERSION = radio_AGC_IIR
#FIRMWARE_VERSION = IIR_oscillator_test
#FIRMWARE_VERSION = radio_AGC_IIR_SAA
#FIRMWARE_VERSION = radio_gain_IIR_SAA


ASMSRCS = crt0.o 
COMMON = print.o util.o spi.o
CSRCS = main.o
# note: the order of objects in the .ldr mirrors the order in this list! (the object files)

OPT = -O2
CPUDEFINES = -D__ADSPBF532__ -D__BLACKFIN__
INCLUDES = -I. -I/opt/uClinux/bfin-elf/bfin-elf/include/ -I../common_bfin/
ASMFLAGS = -x assembler-with-cpp $(INCLUDES) $(CPUDEFINES) -Wall
ASMFLAGS += -mcpu=bf532 -include memory.h -include defBF532.h -D__ASM__ -g
CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory.h -Wall
# note: -O means debug symbols are not loaded.

# For the different firmware version, different memory.h header is used
ifeq ($(FIRMWARE_VERSION), firmware2)
$(info FIRMWARE_VERSION is FIRMWARE2)
	ASMSRCS += firmware2.o
else ifeq ($(FIRMWARE_VERSION), firmware1)
$(info FIRMWARE_VERSION is FIRMWARE1)
	ASMSRCS += firmware1.o
else ifeq ($(FIRMWARE_VERSION), intan_setup_test)
$(info FIRMWARE_VERSION is INTAN_SETUP_TEST)
	ASMSRCS += intan_setup_test.o
else ifeq ($(FIRMWARE_VERSION), intan_setup_test2)
$(info FIRMWARE_VERSION is INTAN_SETUP_TEST2)
	ASMSRCS += intan_setup_test2.o
else ifeq ($(FIRMWARE_VERSION), radio_basic)
$(info FIRMWARE_VERSION is RADIO_BASIC)
	ASMSRCS += radio_basic.o
else ifeq ($(FIRMWARE_VERSION), radio_AGC)
$(info FIRMWARE_VERSION is RADIO_AGC)
	ASMSRCS += radio_AGC.o
else ifeq ($(FIRMWARE_VERSION), radio_AGC_IIR)
$(info FIRMWARE_VERSION is RADIO_AGC_IIR)
	ASMSRCS += radio_AGC_IIR.o
else ifeq ($(FIRMWARE_VERSION), IIR_oscillator_test)
$(info FIRMWARE_VERSION is IIR_OSCILLATOR_TEST)
	ASMSRCS += IIR_oscillator_test.o
else ifeq ($(FIRMWARE_VERSION), radio_AGC_IIR_SAA)
$(info FIRMWARE_VERSION is RADIO_AGC_IIR_SAA)
	ASMSRCS += radio_AGC_IIR_SAA.o
else ifeq ($(FIRMWARE_VERSION), radio_gain_IIR_SAA)
$(info FIRMWARE_VERSION is RADIO_GAIN_IIR_SAA)
	ASMSRCS += radio_gain_IIR_SAA.o
else
$(info FIRMWARE_VERSION is DEFAULT)
	ASMSRCS += firmware1.o
endif
	
ASMSRCS += enc.o divsi3.o

LDFLAGS = -T bftiny.x

OBJS = $(ASMSRCS) $(CSRCS) $(COMMON)
BOBJS = $(B_ASMSRCS:%.asm=%.bo) $(CSRCS:%.c=%.bo)

BFINROOT = /opt/uClinux/bfin-elf/bin
AS = $(BFINROOT)/bfin-elf-as
CC = $(BFINROOT)/bfin-elf-gcc
LD = $(BFINROOT)/bfin-elf-ld
LDR = $(BFINROOT)/bfin-elf-ldr
OBDMP = $(BFINROOT)/bfin-elf-objdump
BIN = $(BFINROOT)/bfin-elf-objcopy

%.bo: %.asm
	$(CC) $(ASMFLAGS) $(BRIDGE) -c -o $@ $<

%.o: ../common_bfin/%.c
	$(CC) $(CFLAGS) -c -o $@ $<
	
%.o: ../common_bfin/%.asm
	$(CC) $(ASMFLAGS) -D_AGC_ -c -o $@ $<

%.o: %.asm
	$(CC) $(ASMFLAGS) -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<


#note: delete spi.o each time, as it compiles different for the headstage.
# -- and we don't want to screw anything up.
all: $(OBJS) stage.ldr stage.elf 
	rm -f ../common/spi.o

stage.elf: $(OBJS)
	$(LD) $(LDFLAGS) -g -o stage.elf $(OBJS)

stage.dxe: $(OBJS)
	$(LD) $(LDFLAGS) -o stage.dxe $(OBJS)
	$(LD) $(LDFLAGS) -Map=Linker.map $(OBJS) 

enc_create: enc_create.cpp
	g++ -Wall $< -o $@

enc.asm: enc_create
	./enc_create

%.ldr:%.dxe
	rm -f *.ldr
	$(LDR) -T BF532 -c $@ $<
	$(OBDMP) -d $< > decompile.asm
	perl register_check.pl

clean:
	rm -f *.o *.ldr *.dxe radio_control.asm enc.asm enc_create Linker.map decompile.asm
# For the different firmware version, different memory.h header is used
ifeq ($(FIRMWARE_VERSION), firmware2)
	cp memory_RHA.h memory.h
else ifeq ($(FIRMWARE_VERSION), firmware1)
	cp memory_RHA.h memory.h
else ifeq ($(FIRMWARE_VERSION), intan_setup_test)
	cp memory_RHA.h memory.h
else ifeq ($(FIRMWARE_VERSION), intan_setup_test2)
	cp memory_RHA.h memory.h
else ifeq ($(FIRMWARE_VERSION), radio_basic)
	cp memory_radio_basic.h memory.h
else ifeq ($(FIRMWARE_VERSION), radio_AGC)
	cp memory_AGC.h memory.h
else ifeq ($(FIRMWARE_VERSION), radio_AGC_IIR)
	cp memory_AGC_IIR.h memory.h
else ifeq ($(FIRMWARE_VERSION), IIR_oscillator_test)
	cp memory_AGC_IIR.h memory.h
else ifeq ($(FIRMWARE_VERSION), radio_AGC_IIR_SAA)
	cp memory_AGC_IIR_SAA.h memory.h
else ifeq ($(FIRMWARE_VERSION), radio_gain_IIR_SAA)
	cp memory_gain_IIR_SAA.h memory.h
else
	cp memory_RHA.h memory.h
endif


flash:
	python ../flasher/flash.py stage.ldr
# If error claiming cannot find parallel port appears and you have a
# parallel port, execute:
# 	sudo rmmod lp
# 	sudo modprobe ppdev

reset:
	python ../flasher/flash.py --reset

# To debug using gnICE through jtag, launch
#     bfin-gdbrpoxy -q bfin
# Then in a separate command prompt,
#	  bfin-elf-insight or bfin-elf-gdb stage.dxe
# For the latter, connect to "target remote :2000" 

