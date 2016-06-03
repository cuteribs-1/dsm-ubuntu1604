FROM ubuntu:16.04


MAINTAINER Cuteribs <ericfine1981@live.com>

COPY ./sources.list /etc/apt/

ADD ./packages/xware.tar.gz /app/
#COPY ./packages/*.deb /app/
COPY ./*.sh /app/
RUN chmod +x /app/*.sh


# Install xware
RUN dpkg -i ./packages/libc6_2.23-0ubuntu3_amd64.deb
RUN dpkg -i ./packages/libc6-i386_2.23-0ubuntu3_amd64.deb
RUN dpkg -i ./packages/lib32z1_1.2.8.dfsg-2ubuntu4_amd64.deb
RUN chmod +x /app/xware/portal
VOLUME /app/TDDOWNLOAD


# Install shadowsocks-libev
RUN dpkg -i ./packages/libmbedcrypto0_2.2.1-2_amd64.deb
RUN dpkg -i ./packages/shadowsocks-libev_2.4.6-1_amd64.deb
RUN rm /etc/init.d/shadowsocks-libev


# Install shadowsocks-libev
RUN dpkg -i ./packages/daemon_0.6.4-1_amd64.deb
ADD ./packages/v2ray.tar.gz /app/
RUN chmod +x /app/v2ray/v2ray


# Install privoxy
RUN dpkg -i ./packages/cron_3.0pl1-128ubuntu2_amd64.deb
RUN dpkg -i ./packages/libpopt0_1.16-10_amd64.deb
RUN dpkg -i ./packages/logrotate_3.8.7-2ubuntu2_amd64.deb
RUN dpkg -i ./packages/privoxy_3.0.24-1_amd64.deb
RUN rm /etc/init.d/privoxy

WORKDIR /app
