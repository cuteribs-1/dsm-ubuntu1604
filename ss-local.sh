#!/bin/sh

if [ $ENABLE_HTTP = "yes" ]; then
	confFile="/app/privoxy.conf"

	if [ ! -f "$confFile" ]; then
		echo listen-address 0.0.0.0:$HTTP_PORT > $confFile
		echo forward-socks5 / localhost:$SS_LOCAL_PORT . >> $confFile
	fi

	/usr/sbin/privoxy $confFile
fi

ss-local -s $SS_SERVER_HOST -p $SS_SERVER_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u
