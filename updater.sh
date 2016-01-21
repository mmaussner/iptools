#!/bin/bash
#
INTERFACE="p1p1"
IP=`ifconfig $INTERFACE |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"|head -n1`
MAC=`cat /sys/class/net/$INTERFACE/address`
HOST=`hostname -f`
CURL=curl
PRGPATH=`which $CURL 2>/dev/null`
[ $? -eq 1 ] && {
   # hier Fehlerbehandlung rein -> Programm nicht gefunden
echo kein $CURL installiert
exit
}
$PRGPATH "http://10.230.92.3/inventory.php?hostname=$HOST&mac=$MAC&ip=$IP" 1>log 2>err
echo "$PRGPATH http://10.230.92.3/inventory.php?hostname=$HOST&mac=$MAC&ip=$IP"
