#!/bin/bash

COLECTOR_DIR='/tmp/netflow_captures/'
HOSTNAME=`hostname`

# if the colector dir does not exits, we have to create it
if [ ! -d $COLECTOR_DIR ]; then
	mkdir $COLECTOR_DIR
fi

if [[ $EUID -ne 0 ]]; then
   echo "WARNING: Please execute it as root ***" 1>&2
   exit 1
fi

echo "[+] Deactivating configuration if active ..."
./deactivateNetflow.sh

echo "[+] Enabling module ipt at 127.0.0.1:12345"
modprobe ipt_NETFLOW destination=127.0.0.1:12345 debug=1

echo "[+] Adding firewall rules"

iptables -I FORWARD  -j NETFLOW
iptables -I INPUT -j NETFLOW
iptables -I OUTPUT -j NETFLOW

# rmagan, -t 60 for getting flows every minute
echo [+] Enabling nfcapd collector by running: nfcapd -w -D -t 60 -l $COLECTOR_DIR -I $HOSTNAME -p 12345

nfcapd -w -D -t 60 -l $COLECTOR_DIR -I $HOSTNAME -p 12345
