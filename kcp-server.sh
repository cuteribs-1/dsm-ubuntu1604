#!/bin/sh

INSTALL_FLAG="/app/kcp-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-server	
	touch $INSTALL_FLAG
fi

/app/kcp/kcp-server -l $KCP_PORT -t $TARGET_PORT -mode $MODE -key "$PASSKEY"
