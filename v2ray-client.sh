#!/bin/sh

INSTALL_FLAG="/app/v2ray-client.installed"	
CONF="/app/v2ray-client.json"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/daemon_*.deb
	chmod +x /app/v2ray/v2ray
	
	cp /app/v2ray/v2ray-client.json $CONF
	sed -i "s/LOCAL_PORT/${LOCAL_PORT}/g" $CONF
	sed -i "s/SERVER_ADDR/${SERVER_ADDR}/g" $CONF
	sed -i "s/SERVER_PORT/${SERVER_PORT}/g" $CONF
	sed -i "s/SERVER_UUID/${SERVER_UUID}/g" $CONF
	sed -i "s/SERVER_ALTER_ID/${SERVER_ALTER_ID}/g" $CONF
	
	mkdir /var/log/v2ray/
	
	touch $INSTALL_FLAG
fi

if [ $ENABLE_HTTP = "yes" ]; then
	INSTALL_FLAG="/app/privoxy.installed"	
	
	if [ ! -f "$INSTALL_FLAG" ]; then
		dpkg -i /app/libpopt0_*.deb
		dpkg -i /app/cron_*.deb
		dpkg -i /app/logrotate_*.deb
		dpkg -i /app/privoxy_*.deb
		rm /etc/init.d/privoxy

		PRIVOXY_CONF="/app/privoxy.conf"
		echo listen-address 0.0.0.0:$HTTP_PORT > $PRIVOXY_CONF
		echo forward-socks5 / localhost:$LOCAL_PORT . >> $PRIVOXY_CONF
		
		touch $INSTALL_FLAG
	fi
	
	privoxy $PRIVOXY_CONF
fi

/app/v2ray/v2ray -config $CONF
