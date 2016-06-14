#!/bin/sh

INSTALL_FLAG="/app/kcp-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-server	
	touch $INSTALL_FLAG
fi

${KCP_PORT=':29900'}

${TARGET_PORT='127.0.0.1:12948'}

${MODE='fast2'}
	
${MTU=1400}
	
${SNDWND=1024}
	
${RCVWND=1024}
	
${CRYPT='none'}
	
${KEY='cuteribs'}

/app/kcp/kcp-server -l $KCP_PORT -t $TARGET_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY
