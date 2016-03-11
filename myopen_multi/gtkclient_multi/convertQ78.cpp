#include <iostream>
#include <string>
#include <math.h>

using namespace std;

unsigned int binaryGain(float gain) {
    double fractpart, intpart;

    unsigned int int2bin, fract2bin;

    if (gain < 0) {
        float pos_mag = 128 + gain;
        fractpart = modf(pos_mag, &intpart);
        int2bin = (unsigned int)(intpart + 128);
    }
    else {
        fractpart = modf(gain, &intpart);
        int2bin = (unsigned int) intpart;
    }

    fract2bin = 0;                              // the integer rep of the binary sequence of the fract part
    switch((int)(fractpart/0.1 + 0.5f)) {       // add the 0.5f to make sure it rounds to nearest integer,
        case 1:                                 // otherwise C/C++ rounds toward 0 by default.
            fract2bin = 25; break;
        case 2:
            fract2bin = 51; break;
        case 3:
            fract2bin = 76; break;
        case 4:
            fract2bin = 102; break;
        case 5:
            fract2bin = 128; break;
        case 6:
            fract2bin = 153; break;
        case 7:
            fract2bin = 179; break;
        case 8:
            fract2bin = 204; break;
        case 9:
            fract2bin = 230; break;
    }
    
    cout << "gain=" << gain << endl;
    cout << "intpart=" << intpart << " converts into " << (int2bin << 8) << endl;
    cout << "fractpart=" << fractpart << " converts into " << fract2bin << endl;
    return (int2bin << 8) + fract2bin;
}

/*
    if (intpart < 0) {
        cout << "gain=" << gain << ", intpart=" << intpart << ", fractpart=" << fractpart << endl;
        if (fractpart < 0) {
            cout << "intpart=" << int(intpart-1) << endl;
        } else {
            cout << "intpart=" << int(intpart) << endl;
        }
        cout << "fractpart=" << 1+fractpart << endl;
        return 0;
    }
*/

int main() {
    float gain;
    while (true) {
        cout << "Enter a gain: 0-127.9, increment by 0.1\n";
        cin >> gain;
        cout << "Q7.8 value of gain is: " << binaryGain(gain) << endl;
        cout << "-----\n";
    }
    return 0;
}
