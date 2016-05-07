## Usage: ss-server
docker run -d cuteribs/dsm-ubuntu1604 ./ss-server.sh

env
	$SS_SERVER_PORT: server port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password

	
## Usage: ss-local
docker run -d cuteribs/dsm-ubuntu1604 ./ss-local.sh

env
	$SS_SERVER_HOST: server domain name or IP
	$SS_SERVER_PORT: server port
	$SS_LOCAL_PORT: local port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password
	$ENABLE_HTTP: forward socks5 to http
	$HTTP_PORT: http proxy port

	
## Usage: ss-tunnel
docker run -d cuteribs/dsm-ubuntu1604 ./ss-tunnel.sh

env
	$SS_SERVER_HOST: server domain name or IP
	$SS_SERVER_PORT: server port
	$SS_LOCAL_PORT: local port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password
	$DNS_IP_PORT: target DNS IP:port



## Usage: xware
docker run -d -v /xunlei:/app/xunlei cuteribs/dsm-ubuntu1604 ./xware.sh
