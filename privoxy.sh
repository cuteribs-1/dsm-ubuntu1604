#!/bin/sh

confFile="/app/privoxy.conf"

if [ ! -f "$confFile" ]; then
	echo listen-address 0.0.0.0:$HTTP_PORT > $confFile
	echo forward-socks5 / $LINK_NAME:$LINK_PORT . >> $confFile
fi

/usr/sbin/privoxy --no-daemon $confFile
/bin/bash
