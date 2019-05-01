#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Incorrect number of parameters"
    echo "Usage to create the container : ./kilodocker directory_to_mount"
else
echo "Creation and start docker image with mount "$(cd $1 ; pwd)" in /root/work"
xhost +local:root
docker run -t -i --privileged \
 -v /dev/bus/usb:/dev/bus/usb \
 -v "$(cd $1 ; pwd)":/root/work \
 -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
 -e DISPLAY=:0 \
 -e QT_X11_NO_MITSHM=1 \
 --name ark \
 ark:testgui
fi
