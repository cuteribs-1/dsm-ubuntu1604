#!/bin/sh

confFile="/app/polipo.conf"

if [ ! -f "$confFile" ]; then
	echo socksParentProxy = "$LINK_NAME:$LINK_PORT" > $confFile
	echo socksProxyType = socks5 >> $confFile
	echo proxyAddress = "::0" >> $confFile
	echo proxyPort = $HTTP_PORT >> $confFile
	echo logSyslog = false >> $confFile
fi

polipo $confFile
/bin/bash

