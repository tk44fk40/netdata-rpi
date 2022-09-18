FROM debian

LABEL original_maintainer "Signal Flag Z"
LABEL edited_by "tk44fk40"

# for debian
RUN echo "install apt-fast..." \
 && apt-get update \
 && apt-get -y install \
    curl \
    gnupg \
    ca-certificates \
    zstd \
    aria2 \
    gdebi \
 && curl -fsSL 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xa2166b8de8bdc3367d1901c11ee2ff37ca8da16b' > /etc/apt/trusted.gpg.d/apt-fast.asc \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/apt-fast.asc] https://ppa.launchpadcontent.net/apt-fast/stable/ubuntu jammy main" > /etc/apt/sources.list.d/apt-fast.list \
 && apt-get update \
 && apt-get clean \
 && apt-get -d install apt-fast \
 && cd /var/cache/apt/archives/ \
 && deb=$(ls *.deb) \
 && ar x $deb \
 && unzstd control.tar.zst \
 && unzstd data.tar.zst \
 && xz control.tar \
 && xz data.tar \
 && rm $deb \
 && ar cr $deb debian-binary control.tar.xz data.tar.xz \
 && DEBIAN_FRONTEND=noninteractive gdebi -n $deb \
 && cd \
 && echo "install libs as tools..." \
 && apt-fast -y --no-install-recommends install \
   sudo \
   autoconf \
   automake \
   build-essential \
   cmake \
   git-core \
   libass-dev \
   libfreetype6-dev \
   libsdl2-dev \
   libtool \
   libva-dev \
   libvdpau-dev \
   libvorbis-dev \
   libxcb1-dev \
   libxcb-shm0-dev \
   libxcb-xfixes0-dev \
   pkg-config \
   texinfo \
   wget \
   zlib1g-dev \
   nasm \
   yasm \
   sudo\
   libx264-dev \
   libvpx-dev \
 && apt-get -y autoremove \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* \
 && echo "Done."

COPY ./buildFF.sh  /root

# ALSA Version
ENV V_ALSA="1.2.7.2"

#CMD ["/bin/bash", "-c",  "/root/buildFF.sh"]
