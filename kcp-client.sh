#!/bin/sh

INSTALL_FLAG="/app/kcp-client.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-client	
	touch $INSTALL_FLAG
fi

if [ ! $LOCAL_PORT ]; then
	LOCAL_PORT = ":12948"
fi

if [ ! $KCP_PORT ]; then
	KCP_PORT = "vps:29900"
fi

if [ ! $MODE ]; then
	MODE = "fast2"
fi

if [ ! $MTU ]; then
	MTU = 1400
fi

if [ ! $SNDWND ]; then
	SNDWND = 128
fi

if [ ! $RCVWND ]; then
	RCVWND = 1024
fi

if [ ! $CRYPT ]; then
	CRYPT = "none"
fi

if [ ! $KEY ]; then
	KEY = "cuteribs"
fi

/app/kcp/kcp-client -l $LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY
