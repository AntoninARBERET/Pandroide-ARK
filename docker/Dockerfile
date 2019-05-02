#To build image from this file, use the following command from the directory of the file
#docker build -t ark .


#IMPORTANT : Once the image is built, run it with the following command (you need nvidia docker 2) to give it acces to your GPU, the next one add acces to the display too

#docker run -ti --rm \    
#       --runtime=nvidia\
#       -e NVIDIA_VISIBLE_DEVICES=all\
#       -e DISPLAY=$DISPLAY \
#		--device=/dev/video0
#       -v /tmp/.X11-unix:/tmp/.X11-unix \
#       image:vesion




#FROM ubuntu:14.04
FROM nvidia/cuda:8.0-devel

#Installations

RUN apt-get update && apt-get install -y firefox \
    build-essential \
    git \
    vim \
    wget \
    sudo \
    software-properties-common \
	usbutils \
    qtcreator


RUN apt-get install -y cmake cmake-qt-gui 

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

#Permissions d'affichage

# Replace 1000 with your user / group id
RUN export uid=1002 gid=1002 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer


#OpenCV
WORKDIR ~/code/opencv-3.1.0

RUN git clone https://github.com/daveselinger/opencv.git && echo "Cloned"

WORKDIR opencv

RUN git checkout 3.1.0-with-cuda8

WORKDIR ../build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D WITH_CUBLAS=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" ../opencv

RUN make -j $(($(nproc) + 1))
RUN sudo make install

#ARK

WORKDIR ../../ARK
RUN git clone https://github.com/nekonaute/KilobotArena-Paris.git && echo "Cloned"
RUN sudo apt-get install qt5-default
WORKDIR KilobotArena-Paris

#Ark est deja build dans le repo
#RUN sudo qmake
#RUN make

#Calibration

WORKDIR ..
RUN git clone https://github.com/DiODeProject/KilobotArenaCalibration.git && echo "Cloned"



USER developer
ENV HOME /home/developer


#pour tester l'affichage /usr/bin/firefox
