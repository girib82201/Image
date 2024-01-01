# 安装更新必要软件
pkg upgrade -y
pkg install -y root-repo
pkg install -y busybox
# 需要使用proot和resolv-conf避免DNS解析出错
pkg install -y proot
pkg install -y resolv-conf
pkg install -y wget
pkg install -y screen
pkg install -y openssl
pkg install -y openssh
pkg install -y vim
pkg install -y unzip
# 创建DNS解析文件
echo "nameserver 1.1.1.1" > $PREFIX/etc/resolv.conf
echo "nameserver 1.0.0.1" >> $PREFIX/etc/resolv.conf
# 获取最新版Xray链接及文件名
latestFile=$(wget -qO- -t1 -T2 https://api.github.com/repos/XTLS/Xray-core/releases/latest | jq -r .assets[].browser_download_url | grep -E "Xray-android-arm64-v8a.zip$")
fileName=$(echo $latestFile | awk -F "/" '{print $NF}')
# 下载Xray并解压
cd ~
wget $latestFile -O $fileName && unzip $fileName -d ./xray && rm -f $fileName
# 创建启动脚本并给予执行权限
cd $PREFIX/etc/profile.d/
cd . > xray.sh
echo '#!/data/data/com.termux/files/usr/bin/bash' >> xray.sh
echo '# 清除 dead screen 并关闭所有已存在的 screen' >> xray.sh
echo 'screen -wipe' >> xray.sh
echo 'screen -ls | awk '\''NR>=2&&NR<=20{print $1}'\'' | awk '\''{print "screen -S "$1" -X quit"}'\'' | sh' >> xray.sh
echo '# 直接执行 screen 会导致脚本中断，需要创建 screen 后再逐条发送命令' >> xray.sh
echo 'screen_name=$"xray"' >> xray.sh
echo 'screen -dmS $screen_name' >> xray.sh
echo '# 输入所需的命令，太长会导致卡死，可逐一发送' >> xray.sh
echo 'cmd=$"cd /data/data/com.termux/files/home/xray && proot -b $PREFIX/etc/resolv.conf:/etc/resolv.conf ./xray run -c config.json"' >> xray.sh
echo '# 发送命令到指定screen，需要额外输入换行符（回车键）执行命令' >> xray.sh
echo 'screen -x -S $screen_name -p 0 -X stuff "$cmd"' >> xray.sh
echo 'screen -x -S $screen_name -p 0 -X stuff $'\''\n'\''' >> xray.sh
chmod +x xray.sh