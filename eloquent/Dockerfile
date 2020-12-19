FROM osrf/ros:eloquent-desktop
MAINTAINER Daniel Hammer braineniac@protonmail.com

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

RUN apt-get update && apt install -y \
  sudo \
  zsh \
  wget \
  vim \
  fonts-powerline \
  mesa-utils

# install NVIDIA gpu driver and cuda
RUN apt-get update && apt install -y --no-install-recommends \
  software-properties-common \
  && add-apt-repository -y ppa:graphics-drivers/ppa
RUN apt-get install -y build-essential dkms
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends nvidia-driver-435
RUN apt-get update && apt-get install -y --no-install-recommends nvidia-cuda-toolkit gcc
ENV NVIDIA_REQUIRE_CUDA "cuda>=9.1"

ENV TERM xterm
ENV ZSH_THEME powerlevel10k/powerlevel10k

# configure user and groups
ARG UNAME=dan
ENV USER $UNAME
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -G sudo -o -s /bin/zsh $UNAME
RUN echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $UNAME

# zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
COPY ./conf/.zshrc /home/$UNAME/.zshrc
COPY ./conf/.p10k.zsh /home/$UNAME/.p10k.zsh

# create workspace
RUN mkdir -p /home/$UNAME/work/ros2
WORKDIR /home/$UNAME/work/ros2

# set up ROS
RUN rosdep update
SHELL ["/bin/zsh", "-c", "source /opt/ros/melodic/setup.zsh"]
CMD ["zsh"]
