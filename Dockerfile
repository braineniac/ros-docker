FROM ros:melodic
MAINTAINER Daniel Hammer braineniac@protonmail.com

RUN apt-get update && apt install -y \
	sudo \
	zsh \
	wget \
	vim \
	fonts-powerline
	

ENV TERM xterm
ENV ZSH_THEME agnoster

# configure user and groups
ARG UNAME=user
ENV USER $UNAME
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -G sudo -o -s /bin/zsh $UNAME
RUN echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $UNAME

# zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
COPY conf/.zshrc /home/$UNAME/.zshrc

# create workspace
RUN mkdir -p /home/$UNAME/ws/ros
WORKDIR /home/$UNAME/ws/ros


SHELL ["/bin/zsh", "-c", "source /opt/ros/melodic/setup.zsh"]
CMD ["zsh"]
