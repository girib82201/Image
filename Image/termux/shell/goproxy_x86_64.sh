#!/data/data/com.termux/files/usr/bin/bash
cd ~/goproxy
./proxy socks -t tcp -p "0.0.0.0:10808" --dns-address "8.8.8.8:53,8.8.4.4:53,223.5.5.5:53,223.6.6.6:53" --dns-ttl 300 --daemon
./proxy socks -t kcp -p "0.0.0.0:10808" --dns-address "8.8.8.8:53,8.8.4.4:53,223.5.5.5:53,223.6.6.6:53" --dns-ttl 300 --daemon