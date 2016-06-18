#!/bin/sh

INSTALL_FLAG="/app/ss-local.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/libmbedcrypto0_*.deb
	dpkg -i /app/shadowsocks-libev_*.deb
	rm /etc/init.d/shadowsocks-libev
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
		echo forward-socks5 / localhost:$SS_LOCAL_PORT . >> $PRIVOXY_CONF
		
		touch $INSTALL_FLAG
	fi
	
	privoxy $PRIVOXY_CONF
fi

ss-local -s $SS_SERVER_HOST -p $SS_SERVER_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A
