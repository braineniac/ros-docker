FROM ros:melodic
MAINTAINER Daniel Hammer braineniac@protonmail.com

# install zsh
RUN apt-get update && apt install zsh -y

# configure user and groups
ARG UNAME=user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/zsh $UNAME
USER $UNAME

# switch user to zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh /home/$UNAME/.oh-my-zsh
COPY conf/.zshrc /home/$UNAME/.oh-my-zsh

# create workspace
RUN mkdir -p /home/$UNAME/ws/ros
WORKDIR /home/$UNAME/ws/ros


SHELL ["/bin/zsh", "-c", "source /opt/ros/melodic/setup.zsh"]
