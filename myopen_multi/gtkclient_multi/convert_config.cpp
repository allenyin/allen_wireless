#include <iostream>
#include <fstream>
#include <string>
#include "proto/parameters.pb.h"

using namespace std;

/* compile with, after protocol buffer files are compiled:
 * g++ convert_config.cpp proto/parameters.pb.cc -o convert_config `pkg-config --cflags --libs protobuf`
 */

// RHA to RHD channel conversion with an Intan amp
const int RHA2RHD_tab[32] = {24,25,26,27,28,29,30,31,0,1,
                         2,3,4,5,6,7,23,22,21,20,19,19,
                         17,16,15,14,13,12,11,10,9,8};

// RHD to RHA channel conversion within an Intan amp
const int RHD2RHA_tab[32] = {8,9,10,11,12,13,14,15,31,30,29,
                         28,27,26,25,24,23,22,21,20,19,18,17,16,
                         0,1,2,3,4,5,6,7};

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
        for (int i=0; i<128; i++) {
            int amp = i/32;           // 0 to 3, which of the four amps the channel's at
            int newchan = 0;
            if (act == RHA2RHD)
                newchan = RHA2RHD_tab[i&31];
            else if (act == RHD2RHA)
                newchan = RHD2RHA_tab[i&31];
            else {
                cout << "Invalid option!" << endl;
                exit(0);
            }
            
            int ch = amp*32+newchan; // channel within current 128 channels of one headstage
            int id = ch + 128*r;     // order within all headstages' channels
           
            const Configuration::channels& in_chan = in_radio.channel(i);     // Channel in RHA
            Configuration::channels* out_chan = out_radio->add_channel();

            out_chan->set_id(id);
            out_chan->set_ch(ch);
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
            out_chan->set_agc(in_chan.gain());
            out_chan->set_gain(in_chan.agc());

            for(int j=0; j<6; j++) {
                out_chan->add_pca_mean(in_chan.pca_mean(j));
                out_chan->add_pca_max(in_chan.pca_max(j));
            }
        }
    }
    // save selected channels
    for (int i=0; i<4; i++) {
        out_params.add_selected(in_params.selected(i));
    }
    // save signal_chain
    out_params.set_signal_chain(in_params.signal_chain());
    cout << "Output params------------" << endl;
    listChannels(out_params);

    fstream output(outName.c_str(), ios::out | ios::trunc | ios::binary);
    if (!out_params.SerializeToOstream(&output)) {
        cout << "Failed to write parameters to RHD format." << endl;
    }
    output.close();
} 

int main(int argc, char* argv[]) {
    if (argc != 4 && argc != 2) {
        cout << "Usage: convert_config [option] infile.bin outfile.bin" << endl;
        cout << "       or just: convert_config infile.bin" << endl;
        cout << "       option is either RHA2RHD or RHD2RHA" << endl;
        cout << "       The default option will look for configuration.bin and use RHA2RHD option" << endl;
        exit(0);
    }
    else {
        string option = argv[1];
        string configFile = argv[2];
        string outFile = argv[3];

        ACTION act = RHA2RHD;
        cout << "Option entered is: " << option << endl;
        if (option == "RHA2RHD") {
            cout << "HERE" << endl;
            act = RHA2RHD;
        }
        else if (option == "RHD2RHA") {
            cout << "THERE" << endl;
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

        listChannels(input_params);
        //RewriteChannels(params);

        google::protobuf::ShutdownProtobufLibrary();

        return 0;
    }
}
