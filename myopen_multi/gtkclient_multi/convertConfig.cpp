#include <iostream>
#include <fstream>
#include <string>
#include "proto/parameters.pb.h"

using namespace std;

/* compile with, after protocol buffer files are compiled:
 * g++ convert_config.cpp proto/parameters.pb.cc -o convert_config `pkg-config --cflags --libs protobuf`
 */

/* 
 * Convert between spike-matching templates for RHA_headstage and RHD-headstage, by matching their electrode channels. However, since there are signal chain differences, one has to go through all the channels to reset threshold and AGC target, etc. So not too useful after all..
 */


/* RHA and RHD amplifier electrode layout correspondence
 * RHA | RHD
 * 0   | 7
 * 1   | 6
 * 2   | 5
 * 3   | 4
 * 4   | 3
 * 5   | 2
 * 6   | 1
 * 7   | 0
 * 8   | 31
 * 9   | 30
 * 10  | 29
 * 11  | 28
 * 12  | 27
 * 13  | 26
 * 14  | 25
 * 15  | 24
 * 16  | 8
 * 17  | 9
 * 18  | 10
 * 19  | 11
 * 20  | 12
 * 21  | 13
 * 22  | 14
 * 23  | 15
 * 24  | 16
 * 25  | 17
 * 26  | 18
 * 27  | 19
 * 28  | 20
 * 29  | 21
 * 30  | 22
 * 31  | 23
 */

// RHD to RHA channel conversion with an Intan amp
// i.e. ch0,1,2,3.. of RHA should be equivalent to ch.. on RHD
const int RHD2RHA_tab[32] = {7,6,5,4,3,2,1,0,
                             31,30,29,28,27,26,25,24,
                             8,9,10,11,12,13,14,15,16,
                             17,18,19,20,21,22,23};

// RHA to RHD channel conversion within an Intan amp, 
// i.e. ch0,1,2,3 of RHD should be equivalent to ch..on RHA
const int RHA2RHD_tab[32] = {7,6,5,4,3,2,1,0,
                             16,17,18,19,20,21,22,23,
                             24,25,26,27,28,29,30,31,
                             15,14,13,12,11,10,9,8};

enum ACTION {RHA2RHD, RHD2RHA};

void listChannels(const Configuration::parameters& params) {
    for (int i=0; i < params.radio_size(); i++) {
        const Configuration::radios radio = params.radio(i);
        cout << "----Channels for radio " << i << "-----" << endl;
        cout << "radio id= " << radio.id() << endl;
        for (int c=0; c<128; c++) {
            const Configuration::channels chan = radio.channel(c);
            cout << "Channel " << c << ":" << endl;
            cout << "ch# " << chan.ch() << endl;
            cout << "id# " << chan.id() << endl;
            cout << "Unit 0 aperture: " << chan.unit(0).aperture() << endl;
            cout << "Unit 1 aperture: " << chan.unit(1).aperture() << endl;
            cout << "Threshold: " << chan.threshold() << endl;
            cout << endl;
        }
    }
}

void convertFormat(const Configuration::parameters& in_params, string outName, ACTION act) {

    Configuration::parameters out_params;
    // initialize radio
    cout << "Found " << in_params.radio_size() << " radios" << endl;
    for (int r=0; r<in_params.radio_size(); r++) {
        out_params.add_radio();
    }
    // save channels
    for (int r=0; r<in_params.radio_size(); r++) {
        Configuration::radios* out_radio = out_params.mutable_radio(r);
        Configuration::radios in_radio = in_params.radio(r);
        
        out_radio->set_id(in_radio.id());
        // go throuogh in_radio's channels and set the corresponding out_radio's channels
        // odd thing: channels.ch doesn't actually determine what channel gtkclient treats it as,
        //            the order of adding channels does.
        cout << "Converting channels for radio " << in_radio.id() << endl;
        for (int i=0; i<128; i++) {
            // i is index for RHD headstage
            int amp = i/32;           // 0 to 3, which of the four amps the channel's at
            int newchan = 0;
            if (act == RHA2RHD)
                newchan = amp*32 + RHA2RHD_tab[i&31];
            else if (act == RHD2RHA)
                newchan = amp*32 + RHD2RHA_tab[i&31];
            else {
                cout << "Invalid option!" << endl;
                exit(0);
            }

            const Configuration::channels& in_chan = in_radio.channel(newchan);     // Channel in RHA
            Configuration::channels* out_chan = out_radio->add_channel();

            out_chan->set_id(r*127+i);
            out_chan->set_ch(i);
            for(int u=0; u<2; u++) {
                out_chan->add_unit();
            }
            // add units
            for(int j=0; j<2; j++) {
                for(int k=0; k<32; k++) {
                    out_chan->mutable_unit(j)->add_pca(in_chan.unit(j).pca(k));
                }
                for(int k=0; k<16; k++) {
                    out_chan->mutable_unit(j)->add_templates(in_chan.unit(j).templates(k));
                }
                out_chan->mutable_unit(j)->set_aperture(in_chan.unit(j).aperture());
                out_chan->mutable_unit(j)->set_pca_scl(in_chan.unit(j).pca_scl());
            }
            out_chan->set_threshold(in_chan.threshold());
            out_chan->set_centering(in_chan.centering());
            out_chan->set_agc(in_chan.agc());
            out_chan->set_gain(in_chan.gain());

            for(int j=0; j<6; j++) {
                out_chan->add_pca_mean(in_chan.pca_mean(j));
                out_chan->add_pca_max(in_chan.pca_max(j));
            }
        }
    }

    // save selected channels
    cout << "Setting selected channels" << endl;
    for (int i=0; i<4; i++) {
        out_params.add_selected(in_params.selected(i));
    }
    // save signal_chain
    cout << "Setting signal_chain" << endl;
    out_params.set_signal_chain(in_params.signal_chain());
    //cout << "--------Output params------------" << endl;
    //listChannels(out_params);

    fstream output(outName.c_str(), ios::out | ios::trunc | ios::binary);
    if (!out_params.SerializeToOstream(&output)) {
        cout << "Failed to write parameters to RHD format." << endl;
    }
    output.close();
} 

int main(int argc, char* argv[]) {
    if (argc != 4) {
        cout << "Tool to convert configuration for RHA-based wireless headstages" << endl;
        cout << "to be used with RHD-based wireless headstages\n" << endl;
        cout << "Usage: convertConfig [option] infile.bin outfile.bin" << endl;
        cout << "       option is either RHA2RHD or RHD2RHA" << endl;
        exit(0);
    }
    else {
        string option = argv[1];
        string configFile = argv[2];
        string outFile = argv[3];

        ACTION act = RHA2RHD;
        //cout << "Option entered is: " << option << endl;
        if (option == "RHA2RHD") {
            //cout << "HERE" << endl;
            act = RHA2RHD;
        }
        else if (option == "RHD2RHA") {
            //cout << "THERE" << endl;
            act = RHD2RHA;
        }
        else {
            cout << "Option not recognized (RHA2RHD or RHD2RHA)!" << endl;
            exit(0);
        }


        GOOGLE_PROTOBUF_VERIFY_VERSION;

        Configuration::parameters input_params;
        fstream input(configFile.c_str(), ios::in | ios::binary);
        if (!input_params.ParseFromIstream(&input)) {
            cerr << "Failed to parse configuration.bin." << endl;
            return -1;
        }
        
        // convert RHA input_params to RHD format, and save to outFile
        convertFormat(input_params, outFile, act);

        //cout << "---------- Input params-------" << endl;
        //listChannels(input_params);
        //RewriteChannels(params);

        google::protobuf::ShutdownProtobufLibrary();

        return 0;
    }
}
