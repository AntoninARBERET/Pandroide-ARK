#!/bin/bash

#CAMS parameter must be 0 if you don't have 4 cameras connected
CAMS=${1:-1}

if [ $CAMS = 0 ]
then
	docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix ark
else
	docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 -v /tmp/.X11-unix:/tmp/.X11-unix ark
fi