#!/bin/bash

touch /var/lib/dhcp/dhcpd.leases

/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf &
/usr/sbin/in.tftpd &
/usr/sbin/dhcpd --no-pid -f -cf /etc/dhcp/dhcpd.conf

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
