#!/usr/bin/env bash

docker run -it \
				--rm \
				--privileged \
				--hostname ros-melodic \
				--name ros-melodic \
				--mount type=bind,source=/home/dan/work/ros,target=/home/dan/work/ros \
				--net ros-network \
				--env ROS_HOSTNAME=ros-melodic \
				--env ROS_MASTER_URI=http://master:11311 \
				--gpus all \
				--env="DISPLAY=$DISPLAY" \
				--env="QT_X11_NO_MITSHM=1" \
 				--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
				melodic
