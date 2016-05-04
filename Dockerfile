FROM ubuntu:16.04


MAINTAINER Cuteribs <ericfine1981@live.com>


### RUN apt-get update && apt-get install -y lib32z1 logrotate libpopt0 cron
ADD ./packages/xware.tar.gz /app/
COPY ./packages/*.deb /app/
COPY ./*.sh /app/
RUN chmod +x /app/*.sh


# Install xware
RUN dpkg -i /app/libc6_2.23-0ubuntu3_amd64.deb
RUN dpkg -i /app/libc6-i386_2.23-0ubuntu3_amd64.deb
RUN dpkg -i /app/lib32z1_1.2.8.dfsg-2ubuntu4_amd64.deb
RUN rm /app/libc6_2.23-0ubuntu3_amd64.deb
RUN rm /app/libc6-i386_2.23-0ubuntu3_amd64.deb
RUN rm /app/lib32z1_1.2.8.dfsg-2ubuntu4_amd64.deb
RUN chmod +x /app/xware/portal
VOLUME /app/TDDOWNLOAD


# Install shadowsocks-libev
RUN dpkg -i /app/libssl1.0.0_1.0.2g-1ubuntu4_amd64.deb
RUN dpkg -i /app/shadowsocks-libev_2.4.6-1_amd64.deb
RUN rm /app/libssl1.0.0_1.0.2g-1ubuntu4_amd64.deb
RUN rm /app/shadowsocks-libev_2.4.6-1_amd64.deb
RUN rm /etc/init.d/shadowsocks-libev


# Install polipo
RUN dpkg -i /app/polipo_1.1.1-7_amd64.deb
RUN rm /app/polipo_1.1.1-7_amd64.deb
RUN rm /etc/init.d/privoxy


WORKDIR /app
