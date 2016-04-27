## Usage: ss-server
docker run -d cuteribs/dsm-ubuntu15 ./ss-server.sh

env
	$SS_SERVER_PORT: server port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password

	
## Usage: ss-local
docker run -d cuteribs/dsm-ubuntu15 ./ss-local.sh

evn
	$SS_SERVER_HOST: server domain name or IP
	$SS_SERVER_PORT: server port
	$SS_LOCAL_PORT: local port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password

	
## Usage: ss-tunnel
docker run -d cuteribs/dsm-ubuntu15 ./ss-tunnel.sh

evn
	$SS_SERVER_HOST: server domain name or IP
	$SS_SERVER_PORT: server port
	$SS_LOCAL_PORT: local port
	$SS_SERVER_METHOD: encrypt method
	$SS_SERVER_PWD: password
	$DNS_IP_PORT: target DNS IP:port


## Usage: privoxy
docker run -d cuteribs/dsm-ubuntu15 ./privoxy.sh

evn
	$HTTP_PORT: http proxy port
	$LINK_NAME: socket proxy name of docker container link
	$LINK_PORT: socket proxy port of docker container link


## Usage: xware
docker run -d cuteribs/dsm-ubuntu15 ./xware.sh

creates volume map for xware