
'''
Update 12/21/2015:
    See AGC_sim_examples.txt for tests used.
    All values in that document have been checked against actual register values.
----------------------------------------------------
Code to emulate what's going on inside the blackfin.
----------------------------------------------------
// AGC-stage, gain is Q7.8
    r0 = [i1++] || r1 = [i0++];         // r0=AGC gain, r1=AGC target sqrt; i1@final-samp after.
    a0 = r2.l * r0.l, a1 = r2.h * r0.h; // multiply samples by AGC-gain
    a0 = a0 << 8;   
    a1 = a1 << 8;
    r2.l = a0, r2.h = a1;       // r2 contains gained-samples.
    a0 = abs a0, a1 = abs a1;   // Start AGC-update.
    
    // subtract AGC-target (signed ints) from abs, saturate diff. Load gain scaler: r4.l=16384, r4.h=1
    r3.l = (a0 -= r1.l*r1.l), r3.h = (a1 -= r1.h*r1.h) (is) || r4 = [i0++]; 
    a0 = r0.l * r4.l, a1 = r0.h * r4.l;                             // load AGC-gain again and scale.
    r5.l = (a0 -= r3.l * r4.h), r5.h = (a1 -= r3.h * r4.h) (s2rnd); // update AGC gain
    r5 = abs r5 (v) || [i1++] = r2;                                 // save gained-sample. i1@next ch-samp
    [i2++] = r5;                                                    // save AGC-gain. i2 @ final-samp after.
'''
from fixedPointConvert import *

def run_AGC(sample, AGC_gain, target, scaler=16384):
    '''
    Given initial sample, and AGC_gain, run one step of AGC to get:
    - scaled-output
    - new gain

    The sample and AGC_gain should be given in hex, as well as the target.
    '''
    results = {}

    baseline = 0x7fff
    amplitude = sample - 0x7fff
    amplitude_twosComplement = signedInt_to_hex(amplitude, 16)
    results['0. amplitude_signedInt'] = hex(int(amplitude_twosComplement,2))
    
    '''
    a0 = r2.l * r0.l. Multiply sample by AGC-gain.
    Treat factors as signed fractions in Q1.15. Result as signed Q1.31.
    '''
    output_Q31 = decimal_to_Q1_31(hex_to_Q15(sample) * hex_to_Q15(AGC_gain))    # Actual value
    results['1. output_Q31'] = output_Q31

    # a0 = a0 << 8
    output_Q31_shifted = (int(output_Q31, 16) & 0x00ffffff)<<8                  # int rep of hex
    results['2. output_Q31_shifted'] = hex(output_Q31_shifted)

    '''
    r2.l = a0
    Use default "Move register half" instruction.
    Signed fraction format. Round at bit 16, saturate result to Q1.15 and copy.
    '''
    output_Q15 = acc_to_halfReg(output_Q31_shifted, 'default')                  # int rep of hex 
    results['3. output_Q15'] = hex(output_Q15)

    '''
    a0 = abs a0
    '''
    val = hex_to_Q1_31(output_Q31_shifted)                                      # Actual value
    if val >= 0:
        output_Q31_shifted_abs = val                                            # Actual value
    else:
        if abs(val) >= 1:
            output_Q31_shifted_abs = 1.0-2**-31
        else:
            output_Q31_shifted_abs = abs(val)
    results['4. output_Q31_shifted_abs'] = hex(int(decimal_to_Q1_31(output_Q31_shifted_abs),16))

    '''
    r3.l = (a0 -= r1.l*r1.l) (is), r1.l is the target
    '''
    diff_Q15 = mult_acc_to_halfReg(int(decimal_to_Q1_31(output_Q31_shifted_abs),16), target, target, op='sub',mode='is')
    results['5. diff_Q15'] = hex(diff_Q15)


    '''
    a0 = r0.l * r4.l
    Load gain again and scale, r4.l = scaler in hex (16384)
    '''
    scaled_gain = decimal_to_Q1_31(hex_to_Q15(AGC_gain) * hex_to_Q15(scaler))   # Actual value
    results['6. scaled_gain'] = scaled_gain 

    '''
    r5.l = (a0 -= r3.l * r4.h), r4.h = 1 (in hex)
    Subtract diff from scaled-gain
    '''
    new_gain_Q15 = mult_acc_to_halfReg(int(scaled_gain,16), diff_Q15, 1, op='sub',mode='s2rnd')
    results['7. new_gain_Q15'] = hex(new_gain_Q15)

    return results 


def mult_acc_to_halfReg(acc_val, a, b, op='sub', mode='default'):
    '''
    Implement Blackfin's Multiply-Accumulate to halfReg (along with acc_to_halfReg move).
    Input is integer, not string.

    Return hex rep.

    Modes:
    - Default: Signed fraction format. Multiply 1.15 * 1.15 to produce 1.31.
                0x8000 * 0x8000 -> 0x7FFF FFFF. To extract, round 9.31 format at bit 16,
                saturate at 1.15 precision and copy top word.
    
    - is:      Signed integer format. Multiply 16.0*16.0 to produce 32.0 result. No shift
               correction. Saturate to 40.0 format, extract the lower 16 bits of accumulator,
               saturate to 16.0 precision and copy. Between -2^15 and 2^15-1

    - s2rnd:   Signed fraction with scaling and rounding. Multiply 1.15 * 1.15 to produce 1.31.
               0x8000 * 0x8000 yields 0x8000000, but will saturate to 0x7fff in the destination
               half. Sign-extend 1.31 to 9.31 before copying to accumulator. Then saturate to 9.31.
               Extract high 16bits after rounding, saturate to 1.15.
    '''
    if mode is 'is':
        prod = a*b
        prod = sign_extend(prod, 32, 40)    # this is still a binary string
        acc_val = int(sign_extend(acc_val, 32, 40),2)
        if op is 'add':
            new_val = acc_val + int(prod,2)
        if op is 'sub':
            new_val = acc_val + int(invert_bstr(prod),2)+1
        # take care of saturation...if requires more than 40 bits, then the extra bits are lost
        bitLen = len(bin(new_val)[2:])
        if bitLen > 40:
            bstr = bin(new_val)[2:][bitLen-40:]
            new_val = int(bstr,2)
        new_val = new_val & 0xFFFFFFFFFF
        print "(is) new_val is: " + hex(new_val)
        
        # now do extraction
        lower_16bits = new_val & 0x000000FFFF
        print "(is) lower_16bits is: " + hex(lower_16bits)
        if hex_to_signedInt(new_val,40) < 0:
            # if result is negative
            if hex_to_signedInt(lower_16bits,16) > 0:
                return 0x8000   # if extraction is positive, saturate to most negative
            elif hex_to_signedInt(new_val,40) < hex_to_signedInt(lower_16bits,16):
                return 0x8000   # extraction is not small enough, saturate to most negative
        
        if hex_to_signedInt(new_val,40) > 0:
            # if result is positive
            if hex_to_signedInt(lower_16bits,16) < 0:
                return 0x7fff   # extraction is negative, saturate to most positive
            elif new_val > lower_16bits:
                return 0x7fff
        else:
            return lower_16bits     # return hex rep

    if mode is 's2rnd':
        if a == 0x8000 and b == 0x8000:
            return 0x7FFF
        else:
            prod = int(decimal_to_Q1_31(hex_to_Q15(a) * hex_to_Q15(b)),16)
            prod = sign_extend(prod, 32, 40)
            acc_val = int(sign_extend(acc_val, 32, 40),2)
            if op is 'add':
                new_val = acc_val + int(prod, 2)
            if op is 'sub':
                new_val = acc_val + int(invert_bstr(prod),2)+1
            # take care of saturation...if requires more than 40 bits, then the extra bits are lost
            bitLen = len(bin(new_val)[2:])
            if bitLen > 40:
                bstr = bin(new_val)[2:][bitLen-40:]
                new_val = int(bstr,2)
            new_val = new_val & 0xFFFFFFFFFF
            print "(s2rnd) new_val is: " + hex(new_val)
            
            # now extract to destination reg
            new_val = new_val << 1
            # round to bit 16
            new_val = new_val + 2**15
            upper_16bits = (new_val & 0x00FFFF0000) >> 16
            print "(s2rnd) upper_16bits is: " + hex(upper_16bits)
            return upper_16bits

    if mode is 'default':
        if a == 0x8000 and b == 0x8000:
            return 0x7FFF
        else:
            prod = int(decimal_to_Q1_31(hex_to_Q15(a) * hex_to_Q15(b)),16)
            prod = sign_extend(prod, 32, 40)
            acc_val = int(sign_extend(acc_val, 32, 40),2)
            if op is 'add':
                new_val = acc_val + int(prod, 2)
            if op is 'sub':
                new_val = acc_val + int(invert_bstr(prod),2)+1
            # take care of saturation...if requires more than 40 bits, then the extra bits are lost
            bitLen = len(bin(new_val)[2:])
            if bitLen > 40:
                bstr = bin(new_val)[2:][bitLen-40:]
                new_val = int(bstr,2)
            new_val = new_val & 0xFFFFFFFFFF
            print "(default) new_val is: " + hex(new_val)

            # extraction - rounding first
            new_val = new_val + 2**15
            upper_16bits = (new_val & 0x00FFFF0000) >> 16
            print "(default) upper_16bits is: " + hex(upper_16bits)
            return upper_16bits

def acc_to_halfReg(num, mode='default'):
    '''
    Implement Blackfin's "The Accumulator to Half D-Reg move instructions" -- support copy.
    Input is integer, not string.
    
    Modes:
    - Default: Signed fraction Format. Round acc 9.31 format value at 16. This is done by
               adding 1 to accumulator's bit 15, then truncate at bit 16.
               Then saturate result at 1.15 precision. 
    
    - is:      Signed integer format. Extract the lower 16 bits of accumulator, saturate for 16.0 
               precision and copy to the destination. Result between -2^15 and 2^15-1.

    - s2rnd:   Shift the accumulator contents one place to left. Round 9.31 format value at bit 16.
               Saturate result to 1.15 and copy to reg half. Result betweeen -1 and 1-2^-15
    '''

    if mode is 'default':
        num_val = hex_to_Q1_31(num) + 2**-16
        # Saturate...
        if num_val > 1.0-2**-31:
            num_val = 1.0-2**-31
        if num_val < -1.0:
            num_val = -1.0
        new_val_Q31 = int(decimal_to_Q1_31(num_val), 16)
        return new_val_Q31 >> 16    # return hex rep
    
def sign_extend(num, startBits, endBits):
    """
    Given a number (hex rep of binary digits), originally with startBits,
    return its sign extended to endBits value.
    """
    # first get the sign
    if len(bin(num)[2:]) == startBits:
        sign = bin(num)[2]
    else:
        sign = "0"
    return sign*(endBits-len(bin(num)[2:])) + bin(num)[2:]


    



