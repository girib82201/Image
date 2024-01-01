#!/data/data/com.termux/files/usr/bin/bash
cd ~/goproxy
./proxy socks -t tcp -p "0.0.0.0:10808" --dns-address "1.1.1.1:53,1.0.0.1:53" --dns-ttl 300 --daemon
./proxy socks -t kcp -p "0.0.0.0:10808" --dns-address "1.1.1.1:53,1.0.0.1:53" --dns-ttl 300 --daemon