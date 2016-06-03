#!/bin/sh

INSTALL_FLAG="/app/ss-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/libmbedcrypto0_2.2.1-2_amd64.deb
	dpkg -i /app/shadowsocks-libev_2.4.6-1_amd64.deb
	rm /etc/init.d/shadowsocks-libev
	touch $INSTALL_FLAG
fi

ss-server -s 0.0.0.0 -p $SS_SERVER_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A
