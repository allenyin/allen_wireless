# Functions to convert between Q7.8, Q1.15, and Q1.31, and decimal.

def hex_to_Q15(num):
    """
    Num is 16-bit hex,
    Gives the decimal value in Q15.

    Assume num is two's complement representation.
    """
    if num > 0xffff:
        print "Input cannot be represented in Q1.15"
        return

    negative = False
    if bin(num & 0x8000)[2] == '1':
        negative = True

    if not negative:
        return num/(2**15 * 1.0)
    else:
        mag = int(invert_bin(num),2)+1
        return -mag / (2**15 * 1.0)
        
def hex_to_Q1_31(num):
    """
    Num is 32-bit hex,
    Gives its decimal value in Q1.31.
    Assume num is two's complement rep
    """
    if num > 0xffffffff:
        print "Input cannot be represented in Q31"
        return

    negative = False
    if bin(num & 0x80000000)[2] == '1':
        negative = True
    if not negative:
        return num/(2**31 * 1.0)

    else:
        mag = int(invert_bin(num),2)+1
        return -mag / (2**31 * 1.0)

def hex_to_Q8_8(num):
    """
    Num is 16-bit hex,
    Gives its decimal value in Q8.8.

    Assume num is two's complement rep
    """
    if num > 0xffff:
        print "Input cannot be represented in Q8.8"
        return
    negative = False
    if bin(num & 0x8000)[2] == '1':
        negative = True
    if not negative:
        return (num >> 8) + (num & 0x00ff)/(2**8 * 1.0)
    else:
        int_part = (num >> 8)
        int_mag = int(invert_bin(int_part),2)+1
        return -int_mag + (num & 0x00ff)/(2**8 * 1.0)

def decimal_to_Q1_15(num):
    """
    Num is a decimal, convert its value to Q1.15
    binary format, return result in hex.
    """
    if num > 1.0-2**-15 or num < -1.0:
        print "Input cannot be represented in Q1.15"
        return
    bstr = ""
    if num < 0:
        bstr += "1"
        num = num+1
    else:
        bstr += "0"
    bstr += frac2bin(num, 15)
    return hex(int(bstr,2))

def decimal_to_Q1_31(num):
    """
    Num is a decimal, convert its value to Q1.31
    binary format, return result in hex.
    """
    if num > 1.0-2**-31 or num < -1.0:
        print "Input cannot be represented in Q1.31"
        return
    bstr = ""
    if num < 0:
        bstr += "1"
        num = num+1
    else:
        bstr += "0"
    bstr += frac2bin(num, 31)
    return hex(int(bstr,2))

def decimal_to_Q8_8(num):
    """
    Num is a decimal, with integer and fractional part.
    Convert its value to Q8.8 binary format.
    Return its value in hex.
    """
    if num > 128-2**-8 or num < -128.0:
        print "Input cannot be represented in Q8.8"
        return
    bstr = ""
    if num > 0:
        bstr += "0"
        bstr += int2bin(int(num), 7)
        bstr += frac2bin(num-int(num),8)
    else:
        bstr += "1"
        pos_mag = abs(-128 - num)
        bstr += int2bin(int(pos_mag),7)
        bstr += frac2bin(pos_mag-int(pos_mag),8)
    return hex(int(bstr,2))

def hex_to_signedInt(num,n):
    '''
    num is hex, return the actual (decimal) value
    it represents in two's complement.

    n is the number of binary digits it should have.
    '''
    if bin(num & (1<<(n-1)))[2] == "1":
        # num is negative
        return num-2**n
    else:
        return num

def signedInt_to_hex(num, n):
    '''
    num is the actual value of the signed integer,
    return the two's complement of the number, using n digits (in string)
    '''
    bstr = ""
    if num < 0:
        bstr += "1"
        pos_mag = num + 2**(n-1)
        bstr += int2bin(pos_mag, n-1)
    else:
        bstr += "0"
        bstr += int2bin(num, n-1)
    return bstr

def frac2bin(num, n):
    """
    Num is a decimal fraction. Convert its value
    to binary format, where n is the number of
    binary digits we have.
    """
    bstr = ""
    while n > 0:
        num = num * 2
        bstr += str(int(num))
        num = num - int(num)
        n = n-1
    return bstr

def int2bin(num, n):
    """
    Num is a decimal integer. Convert its value
    to binary format, where n is the number of binary
    digits we have.
    """
    bstr = ""
    while n > 0:
        if num >= 2**(n-1):
            bstr += "1"
            num = num - 2**(n-1)
        else:
            bstr += "0"
        n = n-1
    return bstr

def invert_bin(num, n=0):
    '''
    Invert binary number
    '''
    bnum = bin(num)
    ib_string = ""
    for bit in bnum[2:]:
        if bit == "1":
            ib_string +="0"
        else:
            ib_string += "1"
    return ib_string

def invert_bstr(bstr):
    ib_string = ""
    for bit in bstr:
        if bit == "1":
            ib_string += "0"
        else:
            ib_string += "1"
    return ib_string





