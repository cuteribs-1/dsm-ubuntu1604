#!/bin/sh

conf_file="/app/v2ray-client.json"

if [ ! -f "$conf_file" ]; then
	cp /app/v2ray/v2ray-client.json $conf_file
	sed -i "s/LOCAL_PORT/${LOCAL_PORT}/g" $conf_file
	sed -i "s/SERVER_ADDR/${SERVER_ADDR}/g" $conf_file
	sed -i "s/SERVER_PORT/${SERVER_PORT}/g" $conf_file
	sed -i "s/SERVER_UUID/${SERVER_UUID}/g" $conf_file
	sed -i "s/SERVER_ALTER_ID/${SERVER_ALTER_ID}/g" $conf_file
fi

/app/v2ray/v2ray -config $conf_file
