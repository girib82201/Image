#!/data/data/com.termux/files/usr/bin/bash
# 清除 dead screen 并关闭所有已存在的 screen
screen -wipe
screen -ls | awk 'NR>=2&&NR<=20{print $1}' | awk '{print "screen -S "$1" -X quit"}' | sh
# 直接执行 screen 会导致脚本中断，需要创建 screen 后再逐条发送命令
screen_name=$"v2ray"
screen -dmS $screen_name
# 输入所需的命令，太长会导致卡死，可逐一发送
cmd=$"cd /data/data/com.termux/files/home/v2ray && v2ray run -c config.json"
# 发送命令到指定screen，需要额外输入换行符（回车键）执行命令
screen -x -S $screen_name -p 0 -X stuff "$cmd"
screen -x -S $screen_name -p 0 -X stuff $'\n'