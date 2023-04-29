FROM alpine:3.17

RUN apk update
RUN apk add dhcp
RUN apk add tftp-hpa
RUN apk add lighttpd
RUN apk add bash

COPY examples/etc/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY start.sh /start.sh
RUN chmod a+x /start.sh
COPY talos/ /srv/talos/

ENTRYPOINT /start.sh
