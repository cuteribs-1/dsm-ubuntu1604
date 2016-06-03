#!/bin/sh

INSTALL_FLAG="/app/v2ray-server.installed"
CONF="/app/v2ray-server.json"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/daemon_0.6.4-1_amd64.deb
	chmod +x /app/v2ray/v2ray	
	
	cp /app/v2ray/v2ray-server.json $CONF
	sed -i "s/SERVER_PORT/${SERVER_PORT}/g" $CONF
	sed -i "s/SERVER_UUID/${SERVER_UUID}/g" $CONF
	sed -i "s/SERVER_ALTER_ID/${SERVER_ALTER_ID}/g" $CONF
	
	touch $INSTALL_FLAG
fi

/app/v2ray/v2ray -config $CONF