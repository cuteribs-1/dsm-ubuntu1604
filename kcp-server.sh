#!/bin/sh

INSTALL_FLAG="/app/kcp-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-server	
	touch $INSTALL_FLAG
fi

echo ${KCP_PORT=':29900'}

echo ${TARGET_PORT='127.0.0.1:12948'}

echo ${MODE='fast2'}
	
echo ${MTU=1350}
	
echo ${SNDWND=1024}
	
echo ${RCVWND=1024}
	
echo ${CRYPT='none'}
	
echo ${KEY='cuteribs'}

sleep 1
/app/kcp/kcp-server -l $KCP_PORT -t $TARGET_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY
