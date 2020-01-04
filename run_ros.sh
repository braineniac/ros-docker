#!/usr/bin/env bash

docker run -it \
				--hostname $1 \
				--name $1 \
				--mount type=bind,source=/home/dan/ws/ros,target=/home/dan/ws/ros \
				--env="DISPLAY=$DISPLAY" \
				--env="QT_X11_NO_MITSHM=1" \
    		--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
				--net ros-network \
				--env ROS_HOSTNAME=$1 \
				--env ROS_MASTER_URI=http://master:11311 \
				--gpus all \
				melodic nvidia-smi
