#!/data/data/com.termux/files/usr/bin/bash
cd ~/goproxy
./proxy http -t tcp -p "0.0.0.0:10807" --hosts="file:///data/data/com.termux/files/home/goproxy/hosts" --dns-address "8.8.8.8:53,8.8.4.4:53,223.5.5.5:53,223.6.6.6:53" --dns-ttl 300 --daemon
./proxy http -t kcp -p "0.0.0.0:10807" --hosts="file:///data/data/com.termux/files/home/goproxy/hosts" --dns-address "8.8.8.8:53,8.8.4.4:53,223.5.5.5:53,223.6.6.6:53" --dns-ttl 300 --daemon