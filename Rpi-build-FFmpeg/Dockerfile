FROM debian:bullseye-slim

LABEL maintainer "Signal Flag Z"
LABEL edited_by "tk44fk40"

RUN echo "now building..." \
 && echo "updating..." \
 && apt-get update \
 && apt-get upgrade -y \
 && echo "install libs and tools..." \
 && apt-get -y install\
  autoconf \
  automake \
  build-essential \
  cmake \
  curl \
  g++ \
  gcc \
  git \
  libaribb24-dev \
  libasound2 \
  libasound2-dev \
  libass-dev \
  libass9 \
  libfreetype6-dev \
  libmp3lame-dev \
  libnuma-dev \
  libopus-dev \
  libsdl1.2-dev \
  libsdl2-dev \
  libtheora-dev \
  libtheora0 \
  libtool \
  libva-dev \
  libva-drm2 \
  libva-x11-2 \
  libvdpau-dev \
  libvdpau1 \
  libvorbis-dev \
  libvorbisenc2 \
  libvpx-dev \
  libx264-dev \
  libx265-dev \
  libxcb-shape0 \
  libxcb-shm0 \
  libxcb-shm0-dev \
  libxcb-xfixes0 \
  libxcb-xfixes0-dev \
  libxcb1-dev \
  make \
  nasm \
  pkg-config \
  sudo \
  texinfo \
  wget \
  yasm \
  zlib1g-dev \
 && apt-get -y autoremove \
 && echo "Done." \
 && apt-get clean
COPY ./buildFF.sh /root

# ALSA Version
ENV V_ALSA="1.2.7.2"

#CMD ["/bin/bash", "-c", "/root/buildFF.sh"]
