#!/usr/bin/env bash

docker run -d --rm \
	--net ros-network \
	--name master \
	ros:melodic-ros-core \
	roscore
