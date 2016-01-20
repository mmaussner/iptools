#!/bin/bash
#
INTERFACE="p1p1"
IP=`ifconfig $INTERFACE |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"|head -n1`
MAC=`cat /sys/class/net/$INTERFACE/address`
HOST=`hostname -f`
curl "http://10.230.92.3/inventory.php?hostname=$HOST&mac=$MAC&ip=$IP" 1>log 2>err
echo "http://10.230.92.3/inventory.php?hostname=$HOST&mac=$MAC&ip=$IP"
