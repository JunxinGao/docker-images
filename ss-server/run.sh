#!/bin/sh
if [ -f /conf/frpc.ini ]; then
  frpc -c /conf/frpc.ini &
else
  echo "frpc config not exist, skip"
fi
ss-server -s $SERVER_ADDR -p $SERVER_PORT -k ${PASSWORD:-$(hostname)} -m $METHOD -t $TIMEOUT -d $DNS_ADDRS -u $ARGS
