#!/data/data/com.termux/files/usr/bin/bash
pkg install -y wget openssl openssh v2ray libcrypt screen
uname_output=$(uname -a)
if [[ $uname_output == *aarch64* ]]; then
    # 下载goproxy自启动脚本
    cd /data/data/com.termux/files/usr/etc/profile.d
    wget https://izual.site/Download/termux/shell/goproxy_arm64_v8.sh -O goproxy.sh && chmod +x goproxy.sh
    # 下载安装goproxy
    cd ~/ && wget https://izual.site/Download/termux/files/goproxy_arm64_v8.tar
    tar xvf goproxy_x86_64.tar && chmod +x ~/goproxy/proxy
elif [[ $uname_output == *x86_64* || $uname_output == *x86* ]]; then
    cd /data/data/com.termux/files/usr/etc/profile.d
    wget https://izual.site/Download/termux/shell/goproxy_x86_64.sh -O goproxy.sh && chmod +x goproxy.sh
    cd ~/ && wget https://izual.site/Download/termux/files/goproxy_x86_64.tar
    tar xvf goproxy_x86_64.tar && chmod +x ~/goproxy/proxy
else
    echo "系统架构不是 aarch64 也不是 x86"
fi
# 开启存储权限
termux-setup-storage
