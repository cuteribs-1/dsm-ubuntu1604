#!/bin/sh

INSTALL_FLAG="/app/xware.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/libc6_*.deb
	dpkg -i /app/libc6-i386_*.deb
	dpkg -i /app/lib32z1_*.deb
	chmod +x /app/xware/portal
	touch $INSTALL_FLAG
fi

/app/xware/portal
/bin/bash