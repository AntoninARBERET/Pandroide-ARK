#To build image from this file, use the following command from the directory of the file
#docker build -t ark .


#IMPORTANT : Once the image is built, run it with the following command (you need nvidia docker 2) to give it acces to your GPU, the next one add acces to the display too

#docker run -ti --rm \    
#       --runtime=nvidia\
#       -e NVIDIA_VISIBLE_DEVICES=all\
#       -e DISPLAY=$DISPLAY \
#		--device=/dev/video0:/dev/video0 \
#		--device=/dev/video1:/dev/video1 \
#		--device=/dev/video2:/dev/video2 \
#		--device=/dev/video3:/dev/video3 \
#       -v /tmp/.X11-unix:/tmp/.X11-unix \
#       image:vesion

#one line : 
#docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 -v /tmp/.X11-unix:/tmp/.X11-unix ark

#one line no cameras
#docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix ark

#old : --device=/dev/video0




#FROM ubuntu:14.04
FROM nvidia/cuda:8.0-devel

#Parameters : group and user id for display permission, default val = 1000
ARG user_id=1000
ARG group_id=1000





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
RUN export uid=$user_id gid=$group_id && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer


#OpenCV
WORKDIR /home/developer/code/opencv-3.1.0

RUN git clone https://github.com/daveselinger/opencv.git && echo "Cloned"

#Contrib, placer dans un repo git ?
RUN wget https://github.com/opencv/opencv_contrib/archive/3.1.0.tar.gz && echo "Downloaded"

RUN tar -xvzf 3.1.0.tar.gz && echo "unziped"

WORKDIR opencv

RUN git checkout 3.1.0-with-cuda8

WORKDIR ../build

RUN cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-3.1.0/modules/ -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D WITH_CUBLAS=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" ../opencv

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
RUN git clone https://github.com/AntoninARBERET/KilobotArenaCalibration-Paris.git && echo "Cloned"


USER developer
ENV HOME /home/developer

RUN sudo chown -R developer /home/developer

#Acces au 4 camera
RUN sudo usermod -a -G video developer

RUN sudo mknod /dev/video0 c 81 0
RUN sudo ln -s /dev/video0 /dev/video0

RUN sudo mknod /dev/video1 c 81 1
RUN sudo ln -s /dev/video1 /dev/video1

RUN sudo mknod /dev/video2 c 81 2
RUN sudo ln -s /dev/video2 /dev/video2

RUN sudo mknod /dev/video3 c 81 3
RUN sudo ln -s /dev/video3 /dev/video3


#pour tester l'affichage /usr/bin/firefox
