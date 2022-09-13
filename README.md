# Dockerfiles
## Rpi-build-FFmpeg
Building FFmpeg on Rasppberry Pi.
## Netdata-Rpi
Netdata for Raspberr Pi with minimal dashboard.  
Build image and run : `./netdata.sh`  
Browse `http://your-pi-IP:19999/rpi.html`

* Raspberry Pi OS (Legacy) / buster だと使えない？
  * コンテナは起動するが、`http://your-pi-IP:19999` が表示できない
  * Raspberry Pi OS (32-bit/64-bit) / bullseye なら問題ない