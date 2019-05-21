#!/bin/bash

#CAMS must be the number of camera you want to use, default value is 4
CAMS=${1:-4}
#OHC must be 0 if you don't want to use it
OHC=${2:-1}

echo $OHC

if [ $OHC = 0 ]
then
	if [ $CAMS = 0 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 1 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY  --device=/dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 2 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY  --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1  -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 3 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY  --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 4 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY  --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 -v /tmp/.X11-unix:/tmp/.X11-unix ark

	else
		echo "Wrong number of cameras in parameters"
	fi	
else	
	if [ $CAMS = 0 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY --device=/dev/ttyUSB0  -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 1 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY --device=/dev/ttyUSB0 --device=/dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 2 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY --device=/dev/ttyUSB0 --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1  -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 3 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY --device=/dev/ttyUSB0 --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 -v /tmp/.X11-unix:/tmp/.X11-unix ark

	elif [ $CAMS = 4 ]
	then
		docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e DISPLAY=$DISPLAY --device=/dev/ttyUSB0 --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 -v /tmp/.X11-unix:/tmp/.X11-unix ark

	else
		echo "Wrong number of cameras in parameters"
	fi
fi
