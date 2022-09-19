#!/bin/bash
# Build image and run buildFF script.
# Signal Flag Z
dname=buildff
docker build --rm=true -t ${dname} .
if [ "$(docker ps -q -f name=${dname})" ]; then
echo Container ${dname} is running. Stops it.
  docker stop ${dname}
fi
if [ "$(docker ps -aq -f status=exited -f name=$dname)" ]; then
echo Container ${dname} exist. Remove it.
  docker rm ${dname}
fi
mkdir -p /var/tmp/local/bin
mkdir -p /var/tmp/local/ffmpeg_build
mkdir -p /var/tmp/local/ffmpeg_patch
cp patch.diff /var/tmp/local/ffmpeg_patch
docker run \
 -v '/var/tmp/local/bin:/root/bin' \
 -v '/var/tmp/local/ffmpeg_build:/root/ffmpeg_build' \
 -v '/var/tmp/local/ffmpeg_patch:/root/ffmpeg_patch' \
 --rm \
 -it \
 --name ${dname} \
 ${dname} \
 bash
# bash -c '/root/buildFF.sh'

# To change ALSA version.
# docker run -it --env V_ALSA=1.1.9 --name ${dname} ${dname}
#docker cp buildff:/root/bin/ffmpeg ./
#docker cp buildff:/root/bin/ffplay ./
#docker cp buildff:/root/bin/ffprobe ./
