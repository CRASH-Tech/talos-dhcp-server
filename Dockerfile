FROM alpine:3.17

RUN apk update
RUN apk add dhcp
RUN apk add tftp-hpa
RUN apk add lighttpd
RUN apk add bash

COPY start.sh /start.sh
RUN chmod a+x /start.sh
COPY talos/ /srv/
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
RUN touch /var/lib/dhcp/dhcpd.leases

ENTRYPOINT /start.sh
