## Usage: xware
docker run -d --name xware1 -v /xunlei:/app/xunlei cuteribs/dsm-ubuntu1604 ./xware.sh


## Usage: ss-server ver. 2.5.6
docker run -d --name ss-server -p 31080:8080 -e SS_SERVER_PORT=8080 -e SS_SERVER_METHOD="rc4-md5" -e SS_SERVER_PWD="cuteribs" cuteribs/dsm-ubuntu1604 ./ss-server.sh

env
	$SS_SERVER_PORT: server port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password
	$SS_TIMEOUT: socket timeout in seconds
	$SS_UDP: enable udprelay mode (default: "-u")
	$SS_OTA: enable onetime authentication (default: "", set to "-A" to enable it)

	
## Usage: ss-local ver. 2.5.6
docker run -d --name ss-local -p 38338:8338 -p 38123:8123 -e SS_SERVER_HOST="cuteribs.ss" -e SS_SERVER_PORT=8080 -e SS_SERVER_METHOD="rc4-md5" -e SS_SERVER_PWD="cuteribs" -e SS_LOCAL_PORT=8338 -e ENABLE_HTTP="yes" -e HTTP_PORT=8123 cuteribs/dsm-ubuntu1604 ./ss-local.sh

env
	$SS_SERVER_HOST: server domain name or IP
	$SS_SERVER_PORT: server port
	$SS_LOCAL_PORT: local port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password
	$SS_TIMEOUT: socket timeout in seconds
	$SS_UDP: enable udprelay mode (default: "-u")
	$SS_OTA: enable onetime authentication (default: "", set to "-A" to enable it)
	$ENABLE_HTTP: forward socks5 to http
	$HTTP_PORT: http proxy port


## Usage: kcp-server ver. 20161207
docker run -d --name kcp-server -p 39901:29900 -e KCP_PORT=:29900 -e TARGET_PORT=:38081 -e MODE=fast2 -e MTU=1400 -e SNDWND=2048 -e RCVWND=2048 cuteribs/dsm-ubuntu1604 ./kcp-server.sh

env
	$KCP_PORT: kcp server listen address (default: ":29900")
	$TARGET_PORT: target server address (default: "127.0.0.1:12948")
	$MODE: mode for communication: fast3, fast2, fast, normal (default: "fast")
	$MTU: set MTU of UDP packets, suggest 'tracepath' to discover path mtu (default: 1350)
	$SNDWND: set send window size (default: 1024)
	$RCVWND: set receive window size (default: 1024)
	$CRYPT: aes, aes-128, aes-192, salsa20, blowfish, twofish, cast5, 3des, tea, xtea, xor, none (default: "aes")
	$KEY: key for communcation, must be the same as kcptun server (default: "it's a secrect")
	$DSCP: set DSCP(6bit) (default: 0)

	
## Usage: kcp-client ver. 20161207
docker run -d --name kcp-client -p 31080:12948 -e LOCAL_PORT=:12948 -e KCP_PORT=cuteribs.kcp:29900 -e MODE=fast2 -e MTU=1400 -e SNDWND=2048 -e RCVWND=2048 -e CONN=4 cuteribs/dsm-ubuntu1604 ./kcp-client.sh

env
	$LOCAL_PORT: local listen address (default: ":12948")
	$KCP_PORT: kcp server address (default: "vps:29900")
	$MODE: mode for communication: fast3, fast2, fast, normal (default: "fast")
	$SNDWND: set send window size (default: 128)
	$RCVWND: set receive window size (default: 2048)
	$CRYPT: aes, aes-128, aes-192, salsa20, blowfish, twofish, cast5, 3des, tea, xtea, xor, none (default: "aes")
	$KEY: key for communcation, must be the same as kcptun server (default: "it's a secrect")
	$CONN: establish N physical connections as specified by 'conn' to server (default: 1)
	$DSCP: set DSCP(6bit) (default: 0)
	$EXPIRE: set auto expiration time(in seconds) for a single UDP connection, 0 to disable (default: 0)
	
	
## Usage: 3proxy
docker run -d --name 3proxy -p 30080:1080 -e PORT=1080 cuteribs/dsm-ubuntu1604 ./3proxy.sh

env
	$PORT: local listen port (default: "1080")

	