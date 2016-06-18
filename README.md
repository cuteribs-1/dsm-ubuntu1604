## Usage: xware
docker run -d --name xware1 -v /xunlei:/app/xunlei cuteribs/dsm-ubuntu1604 ./xware.sh


## Usage: ss-server
docker run -d --name ss-server -p 31080:8080 -e SS_SERVER_PORT=8080 -e SS_SERVER_METHOD="rc4-md5" -e SS_SERVER_PWD="cuteribs" cuteribs/dsm-ubuntu1604 ./ss-server.sh

env
	$SS_SERVER_PORT: server port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password

	
## Usage: ss-local
docker run -d --name ss-local -p 38338:8338 -p 38123:8123 -e SS_SERVER_HOST="cuteribs.ss" -e SS_SERVER_PORT=8080 -e SS_SERVER_METHOD="rc4-md5" -e SS_SERVER_PWD="cuteribs" -e SS_LOCAL_PORT=8338 -e ENABLE_HTTP="yes" -e HTTP_PORT=8123 cuteribs/dsm-ubuntu1604 ./ss-local.sh

env
	$SS_SERVER_HOST: server domain name or IP
	$SS_SERVER_PORT: server port
	$SS_LOCAL_PORT: local port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password
	$ENABLE_HTTP: forward socks5 to http
	$HTTP_PORT: http proxy port

	
## Usage: ss-tunnel
docker run -d --name ss-tunnel -p 38053:8053 -e SS_SERVER_HOST="cuteribs.ss" -e SS_SERVER_PORT=8080 -e SS_SERVER_METHOD="rc4-md5" -e SS_SERVER_PWD="cuteribs" -e SS_LOCAL_PORT=8053 -e DNS_IP_PORT=8.8.8.8 cuteribs/dsm-ubuntu1604 ./ss-tunnel.sh

env
	$SS_SERVER_HOST: server domain name or IP
	$SS_SERVER_PORT: server port
	$SS_LOCAL_PORT: local port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password
	$DNS_IP_PORT: target DNS IP:port


## Usage: v2ray-server
docker run -d --name v2ray-server -p 38090:8090 -e SERVER_PORT=8090 -e SERVER_UUID="e717f3cb-ed1f-40b5-b363-86e434615aed" -e SERVER_ALTER_ID="4" cuteribs/dsm-ubuntu1604 ./v2ray-server.sh

env
	$SERVER_PORT: server port
	$SERVER_UUID: user ID
	$SERVER_ALTER_ID: alter ID

	
## Usage: v2ray-client
docker run -d --name v2ray-client -p 30086:10086 -p 38123:8123 -e LOCAL_PORT=10086 -e SERVER_ADDR="cuteribs.v2ray" -e SERVER_PORT=38090 -e SERVER_UUID="e717f3cb-ed1f-40b5-b363-86e434615aed" -e SERVER_ALTER_ID="4" -e ENABLE_HTTP="yes" -e HTTP_PORT=8123 cuteribs/dsm-ubuntu1604 ./v2ray-client.sh

env
	$LOCAL_PORT: local port
	$SERVER_ADDR: server domain name or IP
	$SERVER_PORT: server port
	$SERVER_UUID: user ID
	$SERVER_ALTER_ID: alter ID
	$ENABLE_HTTP: forward socks5 to http
	$HTTP_PORT: http proxy port


## Usage: kcp-server
docker run -d --name kcp-server -p 39901:29900 -e KCP_PORT=:29900 -e TARGET_PORT=:38081 -e MODE=fast2 -e MTU=1400 -e SNDWND=2048 -e RCVWND=2048 cuteribs/dsm-ubuntu1604 ./kcp-server.sh

env
	$KCP_PORT: kcp server listen address (default: ":29900")
	$TARGET_PORT: target server address (default: "127.0.0.1:12948")
	$MODE: mode for communication: fast3, fast2, fast, normal (default: "fast2")
	$MTU: set MTU of UDP packets, suggest 'tracepath' to discover path mtu (default: 1400)
	$SNDWND: set send window size (default: 2048)
	$RCVWND: set receive window size (default: 2048)
	$CRYPT: methods for encryption: aes, tea, xor, none (default: "none")
	$KEY: key for communcation, must be the same as kcptun server (default: "cuteribs")

	
## Usage: kcp-client
docker run -d --name kcp-client -p 31080:12948 -e LOCAL_PORT=:12948 -e KCP_PORT=cuteribs.kcp:29900 -e MODE=fast2 -e MTU=1400 -e SNDWND=2048 -e RCVWND=2048 -e CONN=4 cuteribs/dsm-ubuntu1604 ./kcp-client.sh

env
	$LOCAL_PORT: local listen address (default: ":12948")
	$KCP_PORT: kcp server address (default: "vps:29900")
	$MODE: mode for communication: fast3, fast2, fast, normal (default: "fast2")
	$SNDWND: set send window size (default: 128)
	$RCVWND: set receive window size (default: 2048)
	$CRYPT: methods for encryption: aes, tea, xor, none (default: "none")
	$KEY: key for communcation, must be the same as kcptun server (default: "cuteribs")
	$CONN: establish N physical connections as specified by 'conn' to server (default: 1)
	
	