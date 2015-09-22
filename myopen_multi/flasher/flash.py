import parallel
import time
import sys
import os

"""
parpin#,  parpin-name,  SPI-name, our name, description
pin2  D0 = _cs,   _CS,   -chip select (active lo, pulled lo, set high to write.)
			  this is broken on the PCB - had to cut & jumper _wr & _cs together!
pin13 SEL = SO,   SI,    -serial output of the flash, connected to an input. called SI here. 
pin3  D1 = SI,    SO,     serial input to the flash, connected to an output, called SO here.
pin4  D2 = SCLK,  SCLK,  -output. 
pin5  D3 = _prog, _PROG, -pull low to hold the processor in reset &
			  prevent it from driving the bus. (& enable the buffer). 
			  in the cable, this is attached to the gate of a fet; 
			  hence, it's an inverted open-collector (drain) output

Program running requires:
    1) rmmod lp
    2) modprobe ppdev
"""
# pin definitions.
_CS = 1 << 0     # D0
SO = 1 << 1      # D1
SCLK = 1 << 2    # D2
_PROG = 1 << 3   # D3
valid_pins = _CS | SO | SCLK | _PROG

# -------- pin functions ----------------
def set_pin(pins):
    # make sure the pins are the usable data-pins
    pins = pins & valid_pins
    p.setData(p.getData() | pins)

def clear_pin(pins):
    pins = pins & valid_pins
    p.setData(p.getData() & ~pins) 

usleep = lambda x: time.sleep(x/1000000.0)

#-------- helper functions --------------
def read_byte():
    clear_pin(SO)
    data = 0

    for i in xrange(8):
        clear_pin(SCLK)
        # data is latched out on the falling edge of SCLK
        clear_pin(SO)
        # check flash output
        if p.getInSelected():
            data = data+1
        if i < 7:
            data = data << 1
        set_pin(SCLK)
        set_pin(SO)
    return data

def write_byte(byte):
    clear_pin(SO)
    # write starting from msb
    for i in xrange(8):
        clear_pin(SCLK)
        if ((byte >> (7-i)) & 0x1):
            set_pin(SO)
        else:
            clear_pin(SO)
        # data is always clocked in on the rising edge of SCLK
        set_pin(SCLK)

def cleanup(doexit):
    # release the devices
    clear_pin(valid_pins)
    if not doexit:
        usleep(60000)
    else:
        sys.exit(0)

def read_status_register(doprint):
    write_byte(0xD7)
    stat = read_byte()
    if doprint:
        print "Status register = %x" % stat
        if stat & 0x80:
            print "Flash ready"
        else:
            print "Flash busy"
        
        print "comp bit = %d" % ( (stat>>6)&1 )
        if (stat & 0x3c) == 0x24:
            print "Density ok"
        else:
            print "Density BAD"
        
        if (stat & 0x02):
            print "Flash protected"
        else:
            print "Flash unprotected"

        if (stat & 0x01):
            print "Page size 256 bytes"
        else:
            print "Page size 264 bytes"
    set_pin(_CS)
    return stat


def write_enable_25():
    # first EWSR
    clear_pin(_CS | SCLK)
    write_byte(0x50)
    set_pin(_CS)
    set_pin(SO)
    # actual status register
    clear_pin(_CS | SCLK)
    write_byte(0x01)
    write_byte(0x00)
    set_pin(_CS)
    set_pin(SO)
    # works for both AT25 and SST25 chips
    clear_pin(_CS | SCLK)
    write_byte(0x06)
    set_pin(_CS)
    set_pin(SO)

def write_disable_SST25():
    # works for both AT25 and SST25
    clear_pin(_CS | SCLK)
    write_byte(0x04)
    set_pin(_CS)
    set_pin(SO)
    # write status register, first EWSR
    clear_pin(_CS | SCLK)
    write_byte(0x50)
    set_pin(_CS)
    set_pin(SO)
    # actual status register
    clear_pin(_CS | SCLK)
    write_byte(0x01)
    write_byte(0x00)
    set_pin(_CS)
    set_pin(SO)

def read_stat_AT25(doprint):
    clear_pin(_CS | SCLK)
    write_byte(0x05)
    stat = read_byte()
    set_pin(_CS)
    set_pin(SO)
    if (stat != 0x11) and (stat != 0x13):
        print "Status register 0x%x\n" % stat

    if stat & 0x80:
        print "Sector protection registers locked!"
    elif doprint:
        print "Sector protection registers unlocked."

    if stat & 0x20:
        print "Erase/program error detected!"
    elif doprint:
        print "Last erase/program operation successful."

    if (stat & 0x10):
        print "Write protect pin de-asserted."
    else:
        print "Write protect pin asserted!"

    if (stat & 0x02) and doprint:
        print "Device is write enabled."
    elif doprint:
        print "Device is not write enable."

    if (stat & 0x01) and doprint:
        print "Device is busy."
    elif doprint:
        print "Device is read."
    return stat

def unprotect_AT25():
    """
    First unprotect all sectors.
    4Mbit device, 256 pages -> 2k pages
    """
    print "Unprotecting all pages..."
    write_enable_25()
    clear_pin(_CS | SCLK)
    write_byte(0x01)
    write_byte(0)   # global unprotect
    set_pin(_CS)
    set_pin(SO)

def block_erase_AT25(data_length):
    addr = 0
    length = 512*1024
    if g_type == 2:
        length = 1024*1024
    for addr in xrange(0, min(data_length, 512*1024), 4096):
        print "Block erase %d ( 0x%x )" % addr, addr
        # unprotect this block
        write_enable_25()
        clear_pin(_CS | SCLK)
        if g_type == 1:
            write_byte(0x39)
        if g_type == 2:
            write_byte(0x52)
        write_byte((addr >> 16) & 0xFF)
        write_byte((addr >> 8) & 0xFF)
        write_byte((addr >> 0) & 0xFF)
        set_pin(_CS)
        set_pin(SO)
        # now do a block erase
        write_enable_25()
        clear_pin(_CS | SCLK)
        write_byte(0x20)
        write_byte((addr >> 16) & 0xFF)
        write_byte((addr >> 8) & 0xFF)
        write_byte((addr >> 0) & 0xFF)
        set_pin(_CS)
        set_pin(SO)
        ctr = 0
        stat = read_stat_AT25(0)
        while (stat & 0x01):
            usleep(1000)
            stat = read_stat_AT25(0)
            ctr = ctr+1
            if ctr % 1000 == 0:
                print "Status register 0x%x\n" % stat
        usleep(1000)

def write_page_AT25(fbuffer, page_size, page):
    """
    index: position inside the overall file buffer that we are starting
           the write from.
    page_size: size of the page we are currently writing.
    page: number of page we are currently writing.
    """
    page = page*256 # position of the flash to which we are starting the write
    print "Writing page @ %d (0x%x)" % (page, page)

    # read the sector protection registers
    clear_pin(_CS | SCLK)
    write_byte(0x3C)
    write_byte( (page >> 16) & 0xFF)
    write_byte( (page >> 8) & 0xFF)
    write_byte(0)   # always going to be a multiple of 256..
    read = read_byte()
    set_pin(_CS)
    set_pin(SO)
    print "Sector protection register %x" % read

    print "Writing buffer..."
    write_enable_25()
    clear_pin(_CS | SCLK)
    write_byte(0x02)
    write_byte((page >> 16) & 0xFF)
    write_byte((page >> 8) & 0xFF)
    write_byte(0)
    for i in xrange(page_size):
        write_byte(fbuffer[i])
    set_pin(_CS)
    set_pin(SO)
    print "Waiting for write to finish..."
    while True:
        if read_stat_AT25(0) & 0x01:
            usleep(1000)
    usleep(1000)

def verify_AT25(fbuffer, page_size, page):
    page = page*256
    print "Verifying page %d (0x%x )..." % (page/256, page)
    clear_pin(_CS | SCLK)
    write_byte(0x0B)
    write_byte((page >> 16) & 0xFF)
    write_byte((page >> 8) & 0xFF)
    write_byte((page >> 0) & 0xFF)
    write_byte(0)
    ok = 1
    for i in xrange(page_size):
        read = read_byte()
        if read is not fbuffer[i]:
            if ok:
                print "\n"
            print "Read flash[%d] expected %02x got %02x" % (i, fbuffer[i], read)
            ok = 0
    if ok:
        print "ok."
    else:
        print "bad."
    set_pin(_CS)
    usleep(100)
    set_pin(SO)
    return ok

def read_stat_SST25(doprint):
    clear_pin(_CS | SCLK)
    write_byte(0x05)
    stat = read_byte()
    set_pin(_CS)
    set_pin(SO)
    if doprint:
        print "Status register 0x%x" % stat
    if stat & 0x80:
        print "Bank protected read-only!"
    elif doprint:
        print "Bank protect bits = read-write."

    if stat & 0x40:
        print "AAI on!"
    elif doprint:
        print "AAI off."

    if stat & 0x0C:
        print "Block protect on!"
    elif doprint:
        print "Block protect off."

    if (stat & 0x02) and doprint:
        print "Device is write enabled."
    elif doprint:
        print "Device is not write enabled. (default)"

    if (stat & 0x01) and doprint:
        print "Device is busy."
    elif doprint:
        print "Device is ready."
    return stat

def sanityCheck_SST25():
    good = 1
    clear_pin(SCLK)
    clear_pin(_CS)
    write_byte(0x90)
    for i in xrange(3):
        read_byte()
    
    r = read_byte()
    if r != 0xBF:
        print "Sanity check: mfr id %x should be 0xBF" % r
        good = 0
    
    r = read_byte()
    if r != 0x8D:
        print "Sanity check: dev id %x should be 0x8D" % r
        good = 0

    set_pin(_CS)
    set_pin(SO)
    write_enable_25()
    status = read_stat_SST25(0) & 0xCF
    if status != 0x02:
        print "Sanity check: status %x should be 0x02" % status
        good = 0

    write_disable_SST25()
    status = read_stat_SST25(0) & 0xCF
    if status != 0:
        print "Sanity check: status %d should be 0" % status
        good = 0

    return good

def eraseChip_SST25():
    # erase the entire SST25 flash chip
    read_stat_SST25(1)
    print "Erasing SST25!"
    write_enable_25()
    clear_pin(_CS | SCLK)
    write_byte(0x60)
    set_pin(_CS)
    set_pin(SO)
    print "Waiting for the erase to complete.."
    usleep(100000)
    r = read_stat_SST25(1)
    while (r & 0x1):
        r = read_stat_SST25(0)
        usleep(5000)

def write_all_SST25(fbuffer, length):
    print "write_all_SST25: writing buffer length %d" % length
    write_enable_25()
    clear_pin(_CS | SCLK)
    write_byte(0xAF)
    write_byte(0)
    write_byte(0)
    write_byte(0)
    write_byte(fbuffer[0])
    set_pin(_CS)
    set_pin(SO)
    usleep(22)
    for i in xrange(length):
        clear_pin(_CS | SCLK)
        write_byte(0xAF)
        write_byte(fbuffer[i])
        set_pin(_CS)
        set_pin(SO)
        usleep(22)
    # disable write
    clear_pin(_CS | SCLK)
    write_byte(0x04)
    set_pin(_CS)
    set_pin(SO)
    usleep(22)

def write_all2_SST25(fbuffer, length):
    print "write_all2_SST25 writing buffer length %d" % length
    for i in xrange(length):
        write_enable_25()
        clear_pin(_CS | SCLK)
        write_byte(0x02)
        write_byte((i>>16) & 0xFF)
        write_byte((i>>8) & 0xFF)
        write_byte(i & 0xFF)
        write_byte(fbuffer[i])
        set_pin(_CS)
        set_pin(SO)
        usleep(22)
    # disable write
    clear_pin(_CS | SCLK)
    write_byte(0x04)
    set_pin(_CS)
    set_pin(SO)
    usleep(22)
    # wait until device is ready again
    while True:
        if not (read_stat_SST25(0) & 0x01):
            break

def verify_SST25(fbuffer, length):
    ok = 1
    print "Verifying all.."
    clear_pin(_CS | SCLK)
    write_byte(0x03)
    write_byte(0x00)
    write_byte(0x00)
    write_byte(0x00)
    for i in xrange(length):
        read = read_byte()
        if read != fbuffer[i]:
            if ok:
                print "\n"
            print "Read flash[%d] expected %02x got %02x" % (i, fbuffer[i], read)
            ok = 0
    if ok:
        print " ok.\n"
    else:
        print " bad.\n"
    set_pin(_CS)
    usleep(100)
    set_pin(SO)
    return ok

def write_page(fbuffer, page_size, page):
    print "Writing buffer"
    clear_pin(_CS)
    write_byte(0x84)
    """
    Tim: See page 28 or 8 on the spec sheet - buffer 1 write.
    Next, we need 15 don't care bits and 9 buffer address bits
    Since we are writing to the beginning of the buffer, this will be 24 zeros.
    """
    write_byte(0x00)
    write_byte(0x00)
    write_byte(0x00)
    for i in xrange(page_size):
        write_byte(fbuffer[i])
    set_pin(_CS)

    # Tim:  now, write the buffer to flash without built-in erase. page 8
    print "Writing buffer to flash"
    clear_pin(_CS)
    write_byte(0x83)
    # next, 3 bytes of page address. (page size=256 bytes, 2^12 pages,
    # hence first 4 bits don't matter
    write_byte( (page & 0xFFF) >> 8)
    write_byte( ( (page & 0xFFF) << 0) & 0xFF)
    write_byte(0x00)
    set_pin(_CS)

    # wait until the device is done
    while (read_status_register(0) & 0x80) == 0:
        usleep(4000)
    usleep(4000)

def verify_page(fbuffer, page_size, page):
    ok = 1
    # read back the flash and verify, page 7 of the datasheet (Allen: prob not the SST25...)
    clear_pin(_CS)
    write_byte(0xD2)
    # 24 address bits - again, first 4 bits don't matter
    write_byte( (page & 0xFFF) >> 8)
    write_byte( ( (page & 0xFFF) << 0) & 0xFF)
    write_byte(0x00)    # read out from the start of a page
    # 32 don't care bits
    write_byte(0x00)
    write_byte(0x00)
    write_byte(0x00)
    write_byte(0x00)
    for i in xrange(page_size):
        read = read_byte()
        if read != fbuffer[i]:
            print "Read flash [%d] expected %02x got %02x" % (i, fbuffer[i], read)
            print "Expected %s, got %s, err at %s" % (bin(fbuffer[i]), bin(read), bin(read ^ fbuffer[i]))
            ok = 0
    if ok:
        print "Flash page %d has been verified :)" % page
    set_pin(_CS)
    return ok   # 1 on success, 0 on failure

#----------------------- Main Program -------------------------
def main():

    if len(sys.argv) < 2:
        print "Please specify the ldr file to be written to the flash."
        print "Alternatively, you can call with the option -r or --reset"
        print "to reset the board without programming it."
        return 0
    if (sys.argv[1] == "--reset") or (sys.argv[1] == "-r"):
        print "Resetting the board.\n"
        set_pin(_PROG)
        usleep(400000)  # enough?
        cleanup(1)
    print "ldr file: %s" % sys.argv[1]

    """
    Read the binary file into a python bytearray. "rb" stands for (r)ead (b)inary
    """
    fbuffer = bytearray(os.path.getsize(sys.argv[1]))
    # obtain file size
    file_size = os.path.getsize(sys.argv[1])
    with open(sys.argv[1], "rb") as f:
        f.readinto(fbuffer)
    print "File size %d bytes, %d pages.\n" % (file_size, (file_size/page_size)+1)


    print "Requesting manufacturer opcode...\n"
    set_pin(_PROG)
    clear_pin(SCLK)
    usleep(10000)
    # leave deep power down
    clear_pin(SCLK)
    clear_pin(_CS)
    write_byte(0xBA)
    set_pin(_CS)
    set_pin(SO)
    usleep(10000)
    # leave deep power down 
    clear_pin(SCLK)
    clear_pin(_CS)
    write_byte(0xBA)
    set_pin(_CS)
    set_pin(SO)
    usleep(10000)

    i = 0
    g_type = 0
    while i < 1000:
        """
        If a bad firmware has been written, leave the processor 
        to constantly reading the flash for a while, because the 
        flash may need to be queried twice before it is ready
        """
        set_pin(_PROG)
        usleep(50)
        clear_pin(SCLK)
        clear_pin(_CS)
        write_byte(0x9f)
        
        for j in xrange(4):
            byte = read_byte()
            print "Read: 0x%x \n" % byte
            
            if g_type == 3:
                i = 1000    # exit loop early
            else:
                # check for outputs from flash
                if j == 0:
                    if byte == 0xbf:
                        print "Looks like microchip flash."
                        g_type = 3
                    elif byte == 0x1f:
                        print "Looks like atmel flash."
                    else:
                        print "Manufacturer ID does not look correct."
                        i = 0
                        cleanup(0)
                    break
                if j == 1:
                    if byte == 0x44:
                        print "Looks like an AT25DF041."
                        g_type = 1
                    elif byte == 0x25:
                        if g_type == 3:
                            # already set throu mfr opcode
                            print "Looks like an SST25VF0404."
                        else:
                            print "Looks like an AT45DB081."
                            g_type = 0
                    elif byte == 0x45:
                        print "Looks like an AT25DF081."
                        g_type = 2
                    elif g_type != 3:
                        print "Pass %d: unrecognized device ID!" % i
                        i = 0
                        cleanup(0)
                    break
                if j == 2:
                    print "Device version %d" % int(byte) 
                    break
                if j == 3:
                    if g_type != 3 and byte != 0x00:
                        print "Extended device information != 0"
                        i = 0
                        cleanup(0)
                    break
        i = i+1 # increment i after every for loop
        # Make sure not to write crap to flash!
        if i > 999 and g_type != 3:
            print "Communication test: completed %d passes" % i
        set_pin(_CS)
        usleep(50)

    print "Detected: "
    if g_type == 0:
        print "AT45DB081"
    if g_type == 1:
        print "AT25DF041"
    if g_type == 2:
        print "AT25DF081"
    if g_type == 3:
        print "SST25VF040"
    if g_type == 1 or g_type == 2:
        print "Status register 0x%x" % read_stat_AT25(0)

    """ 
        Need to make sure the device is in power of 2 binary page size,
        converting to this is a one-time operation.
    """
    if g_type == 0 and (read_status_register(1) & 0x01) == 0:
        userInput = raw_input("""This device is configured for 264-byte pages
        this mode is incompatible with boot streams consisting of 
        multiple sections. Permanently change to 256-byte pages?
        **This operation can NEVER be undone** (type 'y' or 'n') """)
        if userInput is not 'y':
            print "Operation cancelled."
            sys.exit(0)
        else:
            clear_pin(_CS)
            write_byte(0x3d)
            write_byte(0x2a)
            write_byte(0x80)
            write_byte(0xa6)
            set_CS()
            # wait for device to finish, wait until device is done
            while (read_status_register(0) & 0x80) == 0:
                usleep(2000)
            print "Binary page size set. Please power down the board and turn back on to program.\n"
            sys.exit(0)

    if g_type == 2:
        # enter deep power down
        clear_pin(_CS | SCLK)
        write_byte(0xB9)
        set_pin(_CS)
        set_pin(SO)
        usleep(100000)
        # leave deep power down
        clear_pin(_CS | SCLK)
        write_byte(0xAB)
        set_pin(_CS)
        set_pin(SO)
        usleep(10000)
        # leave deep power down
        clear_pin(_CS | SCLK)
        write_byte(0xAB)
        set_pin(_CS)
        set_pin(SO)
        usleep(10000)

    if g_type == 1 or g_type == 2:
        unprotect_AT25()
        block_erase_AT25(file_size)

    if g_type == 3:
        for i in xrange(2000):
            if not sanityCheck_SST25():
                cleanup(1)
        print "SST25 sanity check ok."
        eraseChip_SST25()
        write_all2_SST25(fbuffer, file_size)
    else:
        for i in xrange( (file_size)*1.0/page_size+1):
            ps = file_size - i*page_size
            ps = page_size if ps > page_size else ps
            if (g_type == 0):
                print "Writing page %d size %d" % (i, ps)
                write_page(fbuffer[i*page_size:], ps, i)
            if (g_type == 1):
                print "Writing page %d size %d" % (i, ps)
                write_page_AT25(fbuffer[i*page_size:], ps, i)
    # verifying
    ok = 1
    if g_type == 0:
        for i in xrange( (file_size/page_size)+1):
            ps = file_size - i*page_size
            ps = page_size if ps > page_size else ps
            print "Verifying page %d size %d" % (i, ps)
            ok = ok & verify_page(fbuffer[i*page_size:], ps, i)
    if g_type == 1:
        ok = verify_AT25(fbuffer, file_size, 0)
    if g_type == 3:
        ok = verify_SST25(fbuffer, file_size)
    if not ok:
        print "Not all pages verified properly! Beware! :("
    else:
        print "All pages verified correctly! :)"
    cleanup(0)

#---------------------------------------
if __name__ == '__main__':
    p = parallel.Parallel()
    page_size = 256
    main()



