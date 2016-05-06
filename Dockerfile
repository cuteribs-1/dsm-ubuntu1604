FROM ubuntu:16.04


MAINTAINER Cuteribs <ericfine1981@live.com>

COPY ./sources.list /etc/apt/
# RUN apt-get update
# RUN apt-get install -y libc6 libc6-i386 lib32z1
# RUN apt-get install -y libssl1.0.0
# RUN apt-get install -y cron libpopt0 logrotate privoxy

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


# Install privoxy
RUN dpkg -i /app/cron_3.0pl1-128ubuntu2_amd64.deb
RUN dpkg -i /app/libpopt0_1.16-10_amd64.deb
RUN dpkg -i /app/logrotate_3.8.7-2ubuntu2_amd64.deb
RUN dpkg -i /app/privoxy_3.0.24-1_amd64.deb
RUN rm /app/cron_3.0pl1-128ubuntu2_amd64.deb
RUN rm /app/libpopt0_1.16-10_amd64.deb
RUN rm /app/logrotate_3.8.7-2ubuntu2_amd64.deb
RUN rm /app/privoxy_3.0.24-1_amd64.deb
RUN rm /etc/init.d/privoxy

WORKDIR /app
