#!/usr/bin/env bash

docker run -it \
			--gpus all \
			--rm \
			--env="DISPLAY=$DISPLAY" \
			-e XAUTHORITY \
			--env="NVIDIA_VISIBLE_DEVICES=all" \
			--env="NVIDIA_DRIVER_CAPABILITIES=all" \
			--env="QT_X11_NO_MITSHM=1" \
			--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
			ubuntu:focal bash

