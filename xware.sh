#!/bin/sh

INSTALL_FLAG="/app/xware.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/libc6_2.23-0ubuntu3_amd64.deb
	dpkg -i /app/libc6-i386_2.23-0ubuntu3_amd64.deb
	dpkg -i /app/lib32z1_1.2.8.dfsg-2ubuntu4_amd64.deb
	chmod +x /app/xware/portal
	touch $INSTALL_FLAG
fi

/app/xware/portal
/bin/bash