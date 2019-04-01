FROM nvidia/cuda:8.0-devel

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    vim \
    wget \
	sudo \
	software-properties-common \
	qtcreator

#OpenCV
RUN apt-get install -y cmake cmake-qt-gui 

WORKDIR ~/code/opencv-3.1.0

RUN git clone https://github.com/daveselinger/opencv.git

WORKDIR ~/code/opencv-3.1.0/opencv

RUN git checkout 3.1.0-with-cuda8

RUN sudo apt install --assume-yes build-essential cmake git pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy

RUN sudo apt install libhdf5-dev 

RUN sudo apt install --assume-yes libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev 

RUN sudo apt install --assume-yes libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev 

RUN sudo apt install --assume-yes libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev 

RUN sudo apt install --assume-yes libvorbis-dev libxvidcore-dev v4l-utils 

RUN sudo apt install --assume-yes libvorbis-dev libxvidcore-dev v4l-utils

WORKDIR ~/code/opencv-3.1.0/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D WITH_CUBLAS=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" ../opencv \
	make -j $(($(nproc) + 1)) \
	sudo make install

ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1
ENV QT_X11_NO_MITSHM=1

