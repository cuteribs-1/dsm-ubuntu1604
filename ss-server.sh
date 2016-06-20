#!/bin/sh

INSTALL_FLAG="/app/ss-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/libmbedcrypto0_*.deb
	dpkg -i /app/shadowsocks-libev_*.deb
	rm /etc/init.d/shadowsocks-libev
	touch $INSTALL_FLAG
fi

sleep 1
ss-server -s 0.0.0.0 -p $SS_SERVER_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A
