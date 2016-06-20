#!/bin/sh

INSTALL_FLAG="/app/kcp-client.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-client	
	touch $INSTALL_FLAG
fi

echo ${LOCAL_PORT=':12948'}

echo ${KCP_PORT='vps:29900'}

echo ${MODE='fast2'}
	
echo ${MTU=1400}
	
echo ${SNDWND=1024}
	
echo ${RCVWND=1024}
	
echo ${CRYPT='none'}
	
echo ${KEY='cuteribs'}

echo ${CONN=1}

sleep 1
/app/kcp/kcp-client -l $LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN
