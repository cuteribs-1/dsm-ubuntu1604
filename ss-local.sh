#!/bin/sh

INSTALL_FLAG="/app/ss-local.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/libmbedcrypto0_2.2.1-2_amd64.deb
	dpkg -i /app/shadowsocks-libev_2.4.6-1_amd64.deb
	rm /etc/init.d/shadowsocks-libev
	touch $INSTALL_FLAG
fi

if [ $ENABLE_HTTP = "yes" ]; then
	INSTALL_FLAG="/app/privoxy.installed"	
	
	if [ ! -f "$INSTALL_FLAG" ]; then
		dpkg -i /app/libpopt0_1.16-10_amd64.deb
		dpkg -i /app/cron_3.0pl1-128ubuntu2_amd64.deb
		dpkg -i /app/logrotate_3.8.7-2ubuntu2_amd64.deb
		dpkg -i /app/privoxy_3.0.24-1_amd64.deb
		rm /etc/init.d/privoxy

		PRIVOXY_CONF="/app/privoxy.conf"
		echo listen-address 0.0.0.0:$HTTP_PORT > $PRIVOXY_CONF
		echo forward-socks5 / localhost:$SS_LOCAL_PORT . >> $PRIVOXY_CONF
		
		touch $INSTALL_FLAG
	fi
	
	privoxy $PRIVOXY_CONF
fi

ss-local -s $SS_SERVER_HOST -p $SS_SERVER_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A
