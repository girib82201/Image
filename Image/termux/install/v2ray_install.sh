#!/data/data/com.termux/files/usr/bin/bash
pkg install -y wget openssl openssh v2ray libcrypt screen
# 下载v2ray自启动脚本
cd /data/data/com.termux/files/usr/etc/profile.d
wget https://izual.site/Download/termux/shell/v2ray.sh -O v2ray.sh && chmod +x v2ray.sh
# 下载v2ray配置文件
mkdir ~/v2ray && cd ~/v2ray
wget https://izual.site/Download/termux/conf/v2ray_config.json -O config.json
# 如需配置自定义域名解析，请修改/data/data/com.termux/files/usr/etc/hosts文件后重启Termux
# 开启存储权限
termux-setup-storage
