#!/bin/sh

INSTALL_FLAG="/app/kcp-client.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-client	
	touch $INSTALL_FLAG
fi

/app/kcp/kcp-client -l $LOCAL_PORT -r $KCP_PORT -mode $MODE -key "$PASSKEY"
