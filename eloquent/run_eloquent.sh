#!/usr/bin/env bash

docker run -it \
				--rm \
				--hostname ros-eloquent \
				--mount type=bind,source=/home/dan/work/ros2,target=/home/dan/work/ros2 \
				--net ros-network \
				--env ROS_HOSTNAME=ros-eloquent \
				--env ROS_MASTER_URI=http://master:11311 \
				--gpus all \
				--env="DISPLAY=$DISPLAY" \
				--env="QT_X11_NO_MITSHM=1" \
				--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
				eloquent
