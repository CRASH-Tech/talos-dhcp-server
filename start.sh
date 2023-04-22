#!/bin/bash

/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf &
/usr/sbin/in.tftpd &
/usr/sbin/dhcpd &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
