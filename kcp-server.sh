#!/bin/sh

INSTALL_FLAG="/app/kcp-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-server	
	touch $INSTALL_FLAG
fi

if [! $KCP_PORT ]; then
	KCP_PORT = ":29900"
fi

if [ ! $TARGET_PORT ]; then
	TARGET_PORT = "127.0.0.1:12948"
fi

if [! $MODE ]; then
	MODE = "fast2"
fi

if [ ! $MTU ]; then
	MTU = 1400
fi

if [ ! $SNDWND ]; then
	SNDWND = 1024
fi

if [ ! $RCVWND ]; then
	RCVWND = 1024
fi

/app/kcp/kcp-server -l $KCP_PORT -t $TARGET_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt none
