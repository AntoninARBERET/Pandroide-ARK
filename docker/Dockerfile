#IMPORTANT : Once the image is built, run it with the following command (you need nvidia docker 2) to give it acces to your GPU
#sudo docker run -it --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all --rm image:version

#Start from a docker nvidia image of ubuntu 16.04 including cuda 8.0
FROM nvidia/cuda:8.0-devel

#Basics installations

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    vim \
    wget \
	sudo \
	software-properties-common \
	qtcreator

#OpenCV 3 for cuda 8 (from here : https://gist.github.com/filitchp/5645d5eebfefe374218fa2cbf89189aa)

RUN apt-get install -y cmake cmake-qt-gui 

WORKDIR ~/code/opencv-3.1.0

RUN git clone https://github.com/daveselinger/opencv.git && echo "Cloned"

WORKDIR opencv

RUN git checkout 3.1.0-with-cuda8

RUN sudo apt install --assume-yes build-essential\
	 cmake\
	 git\
	 pkg-config\
	 unzip\
	 ffmpeg\
	 qtbase5-dev\
	 python-dev\
	 python3-dev\
	 python-numpy\
	 python3-numpy

RUN sudo apt install --assume-yes libhdf5-dev 

RUN sudo apt install --assume-yes libgtk-3-dev\
	libdc1394-22\
	libdc1394-22-dev\
	libjpeg-dev\
	libpng12-dev\
	libtiff5-dev\
	libjasper-dev 

RUN sudo apt install --assume-yes libavcodec-dev\
	libavformat-dev\
	libswscale-dev\
	libxine2-dev\
	libgstreamer0.10-dev\
	libgstreamer-plugins-base0.10-dev 

RUN sudo apt install --assume-yes libv4l-dev\
	libtbb-dev\
	libfaac-dev\
	libmp3lame-dev\
	libopencore-amrnb-dev\
	libopencore-amrwb-dev\
	libtheora-dev 

RUN sudo apt install --assume-yes libvorbis-dev\
	libxvidcore-dev\
	v4l-utils 

RUN sudo apt install --assume-yes libvorbis-dev\
	libxvidcore-dev\
	v4l-utils

WORKDIR ~/code/opencv-3.1.0/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D WITH_CUBLAS=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" ../opencv \
	make -j $(($(nproc) + 1)) \
	sudo make install

#ARK

WORKDIR ~/code/ARK
RUN git clone https://github.com/DiODeProject/KilobotArena.git && echo "Cloned"
RUN sudo apt-get install qt5-default
WORKDIR KilobotArena
RUN qmake
#RUN make

