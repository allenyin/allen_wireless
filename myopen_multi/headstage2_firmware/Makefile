# Makefile for  program running in L1 memory
.SUFFIXES: .o .c .asm .bo .asm

#FIRMWARE_VERSION = firmware1
#FIRMWARE_VERSION = firmware2
#FIRMWARE_VERSION = intan_test_setup
#FIRMWARE_VERSION = intan_test_setup2
#FIRMWARE_VERSION = radio_basic
FIRMWARE_VERSION = radio_AGC

$(info FIRMWARE_VERSION is $(FIRMWARE_VERSION))

ASMSRCS = crt0.o 
COMMON = print.o util.o spi.o
CSRCS = main.o
# note: the order of objects in the .ldr mirrors the order in this list! (the object files)

OPT = -O2
CPUDEFINES = -D__ADSPBF532__ -D__BLACKFIN__
INCLUDES = -I. -I/opt/uClinux/bfin-elf/bfin-elf/include/ -I../common_bfin/
ASMFLAGS = -x assembler-with-cpp $(INCLUDES) $(CPUDEFINES) -Wall
# note: -O means debug symbols are not loaded.

ifeq ($(FIRMWARE_VERSION), firmware2)
	ASMSRCS += firmware2.o
	ASMFLAGS += -mcpu=bf532 -include memory.h -include defBF532.h -D__ASM__ -g
	CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory.h -Wall

else ifeq ($(FIRMWARE_VERSION), firmware1)
	ASMSRCS += firmware1.o
	ASMFLAGS += -mcpu=bf532 -include memory.h -include defBF532.h -D__ASM__ -g
	CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory.h -Wall

else ifeq ($(FIRMWARE_VERSION), intan_test_setup)
	ASMSRCS += intan_test_setup.o
	ASMFLAGS += -mcpu=bf532 -include memory.h -include defBF532.h -D__ASM__ -g
	CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory.h -Wall

else ifeq ($(FIRMWARE_VERSION), intan_test_setup2)
	ASMSRCS += intan_test_setup2.o
	ASMFLAGS += -mcpu=bf532 -include memory.h -include defBF532.h -D__ASM__ -g
	CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory.h -Wall

else ifeq ($(FIRMWARE_VERSION), radio_basic)
	ASMSRCS += radio_basic.o
	ASMFLAGS += -mcpu=bf532 -include memory_radio_basic.h -include defBF532.h -D__ASM__ -g
	CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory_radio_basic.h -Wall

else ifeq ($(FIRMWARE_VERSION), radio_AGC)
	ASMSRCS += radio_AGC.o
	ASMFLAGS += -mcpu=bf532 -include memory_AGC.h -include defBF532.h -D__ASM__ -g
	CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory_AGC.h -Wall

else
	ASMSRCS += firmware1.o
	ASMFLAGS += -mcpu=bf532 -include memory.h -include defBF532.h -D__ASM__ -g
	CFLAGS = $(INCLUDES) $(CPUDEFINES) -mcpu=bf532 $(OPT) -include memory.h -Wall
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
	rm -f *.o *.ldr *.dxe radio_control.asm enc.asm enc_create Linker.map

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
