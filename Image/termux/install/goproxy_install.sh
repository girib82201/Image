#!/data/data/com.termux/files/usr/bin/bash
pkg install -y wget openssl openssh v2ray libcrypt screen
cd /data/data/com.termux/files/usr/etc/profile.d
wget https://izual.site/Download/termux/shell/goproxy_x86_64.sh -O goproxy.sh && chmod +x goproxy.sh
cd ~/ && wget https://izual.site/Download/termux/files/goproxy_x86_64.tar
tar xvf goproxy_x86_64.tar && chmod +x ~/goproxy/proxy
# 开启存储权限
termux-setup-storage
