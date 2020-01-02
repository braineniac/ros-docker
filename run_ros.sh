docker run -it \
				--hostname melodic \
				--name melodic \
				--mount type=bind,source=/home/dan/ws/ros,target=/home/dan/ws/ros \
				melodic
