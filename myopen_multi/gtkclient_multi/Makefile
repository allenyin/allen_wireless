# install dependencies with make deps

# The following can be set at the command line
# ie: make DBG=true JACK=false
DBG = true 
JACK = false
MUDFLAP = false
STACKPROTECTOR = false
HEADSTAGE_TIM = false 
RADIO_BASIC = false 
RADIO_AGC = false 
RADIO_AGC_IIR = false 
RADIO_AGC_IIR_SAA = false 
RADIO_GAIN_IIR_SAA = true 

CC  = gcc
CPP = g++
TARGET = /usr/local/bin

HDF5INCLUDE := -I/usr/include/hdf5/serial  # libhdf5 manually installed
CPPFLAGS := -Iinclude -Iproto -I/usr/include -I../common_host $(HDF5INCLUDE)
CPPFLAGS += -Wall -Wcast-align -Wpointer-arith -Wshadow -Wsign-compare \
-Wformat=2 -Wno-format-y2k -Wmissing-braces -Wparentheses -Wtrigraphs \
-Wextra -pedantic -std=c++11 -Wno-int-to-pointer-cast 

CFLAGS := -Wall -Wcast-align -Wpointer-arith -Wshadow -Wsign-compare \
-Wformat=2 -Wno-format-y2k -Wmissing-braces -Wparentheses -Wtrigraphs \
-Wextra -pedantic -std=c99

#LDFLAGS := -lGL -lGLU -lpthread -lCg -lCgGL -lgsl -lcblas -latlas -lm \
-lmatio -lhdf5

# libhdf5 manually installed
HDF5LD := -L/usr/lib/x86_64-linux-gnu/hdf5/serial -lhdf5 -lhdf5_cpp 	
LDFLAGS += -lGL -lGLU -lc -lm -lpthread -lCg -lCgGL -lgsl -lcblas -latlas \
		   -lmatio -lprotobuf $(HDF5LD)

GLIBS := gtk+-2.0 gtkglext-1.0 gtkglext-x11-1.0 protobuf
GTKFLAGS = `pkg-config --cflags $(GLIBS) `
GTKLD = `pkg-config --libs $(GLIBS) `

GOBJS = proto/parameters.pb.o proto/spikes.pb.o src/gtkclient.o src/headstage.o src/decodePacket.o src/gettime.o src/glInfo.o src/sock.o

COBJS = src/convert.o src/decodePacket.o

COM_HDR = include/channel.h include/headstage.h include/spkwriter.h \
../common_host/vbo.h \
../common_host/cgVertexShader.h \
../common_host/firingrate.h \
../common_host/jacksnd.h \
proto/parameters.pb.h proto/spikes.pb.h

PARAM_SRC = proto/parameters.pb.h proto/parameters.pb.cc
SPIKE_SRC = proto/spikes.pb.h proto/spikes.pb.cc

ifeq ($(strip $(DBG)),true)
	CPPFLAGS += -g -rdynamic -DDEBUG
	CFLAGS   += -g -rdynamic -DDEBUG
else
	CPPFLAGS += -O3
	CFLAGS   += -O3
endif

ifeq ($(strip $(JACK)),true)
	CPPFLAGS += -DJACK
	LDFLAGS  += -ljack
	GOBJS    += src/jacksnd.o
endif

ifeq ($(strip $(MUDFLAP)),true)
        CPPFLAGS += -fmudflap -fmudflapth -funwind-tables
        CFLAGS   += -fmudflap -fmudflapth -funwind-tables
        LDFLAGS  += -lmudflap -fmudflapth -rdynamic
endif

ifeq ($(strip $(STACKPROTECTOR)),true)
	CPPFLAGS += -fstack-protector-all
	CFLAGS   += -fstack-protector-all
endif

ifeq ($(strip $(HEADSTAGE_TIM)), true)
	CPPFLAGS += -DHEADSTAGE_TIM
endif

ifeq ($(strip $(RADIO_BASIC)),true)
	CPPFLAGS += -DRADIO_BASIC
	CPPFLAGS := $(filter-out -Wall, $(CPPFLAGS))
endif

ifeq ($(strip $(RADIO_AGC)),true)
	CPPFLAGS += -DRADIO_AGC
	CPPFLAGS := $(filter-out -Wall, $(CPPFLAGS))
endif

ifeq ($(strip $(RADIO_AGC_IIR)), true)
	CPPFLAGS += -DRADIO_AGC_IIR
	CPPFLAGS := $(filter-out -Wall, $(CPPFLAGS))
endif

ifeq ($(strip $(RADIO_AGC_IIR_SAA)), true)
	CPPFLAGS += -DRADIO_AGC_IIR_SAA
endif

ifeq ($(strip $(RADIO_GAIN_IIR_SAA)), true)
	CPPFLAGS += -DRADIO_GAIN_IIR_SAA
endif


all: gtkclient wf_plot convert convertConfig

$(PARAM_SRC): proto/parameters.proto
	protoc -I=./proto --cpp_out=./proto $<

$(SPIKE_SRC): proto/spikes.proto
	protoc -I=./proto --cpp_out=./proto $<

src/%.o: ../common_host/%.cpp $(COM_HDR)
	$(CPP) -c $(CPPFLAGS) $(GTKFLAGS) $< -o $@

src/%.o: src/%.cpp $(COM_HDR)
	$(CPP) -c $(CPPFLAGS) $(GTKFLAGS) $< -o $@

gtkclient: $(GOBJS)
	$(CPP) -o $@ $(GTKFLAGS) $^ $(GTKLD) $(LDFLAGS)

src/%.o: src/%.c
	$(CC) -c $(CFLAGS) $< -o $@

convert: $(COBJS)
	$(CPP) -o $@ $^ -lmatio -lz $(HDF5LD)

convertConfig: convertConfig.cpp proto/parameters.pb.cc
	@touch $@
	rm convertConfig
	$(CPP) $^ -o $@ `pkg-config --cflags --libs protobuf`

wf_plot: src/wf_plot.o
	$(CC) -o $@ $^ -lGL -lGLU -lglut -lpthread -lmatio -lpng $(HDF5LD)

clean:
	rm -rf gtkclient convert wf_plot src/*.o
	rm proto/*.o proto/*.pb.h proto/*.pb.cc
	rm convertConfig

deps:
	sudo apt-get install libgtk2.0-dev \
	libgtkgl2.0-dev libgtkglext1-dev freeglut3-dev nvidia-cg-toolkit \
	libgsl0-dev libatlas-base-dev libjack-jackd2-dev python-matplotlib \
	python-jsonpickle python-opengl pkg-config \
	libhdf5-dev libsdl1.2-dev libprotobuf-dev protobuf-compiler libmatio-dev libboost1.55-all-dev 

	echo "make sure /usr/lib64 is in /etc/ld.so.conf.d/libc.conf"
	echo "otherwise Cg may not be found. "
	echo "Also make sure to install libmatio1.5 from source"
	echo "Dependency is not in debian rep."

install:
	install -d $(TARGET)
	install gtkclient -t $(TARGET)
	install convert -t $(TARGET)
	install -d $(TARGET)/cg
	install cg/fade.cg -t $(TARGET)/cg
	install cg/fadeColor.cg -t $(TARGET)/cg
	install cg/threshold.cg -t $(TARGET)/cg

#Debugging: valgrind --leak-check=full --log-file="logfile.out" -v ./gtkclient
