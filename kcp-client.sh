#!/bin/sh

INSTALL_FLAG="/app/kcp-client.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/kcp/kcp-client	
	touch $INSTALL_FLAG
fi

${LOCAL_PORT=':12948'}

${KCP_PORT='vps:29900'}

${MODE='fast2'}
	
${MTU=1400}
	
${SNDWND=1024}
	
${RCVWND=1024}
	
${CRYPT='none'}
	
${KEY='cuteribs'}

/app/kcp/kcp-client -l $LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY
