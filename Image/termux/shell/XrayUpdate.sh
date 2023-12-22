# 备份config.json
cp ~/xray/config.json ..
# 获取最新版Xray链接及文件名
latestFile=$(wget -qO- -t1 -T2 https://api.github.com/repos/XTLS/Xray-core/releases/latest | jq -r .assets[].browser_download_url | grep -E "Xray-android-arm64-v8a.zip$")
fileName=$(echo $latestFile | awk -F "/" '{print $NF}')
# 下载Xray并解压
cd ~
wget $latestFile -O $fileName && unzip $fileName -d ./xray && rm -f $fileName