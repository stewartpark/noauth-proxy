#!/bin/sh

if [ -z "$PROXY_HOST" ]; then
    echo "PROXY_HOST is not set"
    exit 1
fi

if [ -z "$PROXY_PORT" ]; then
    echo "PROXY_PORT is not set"
    exit 1
fi

if [ -z "$PROXY_USERNAME" ]; then
    echo "PROXY_USERNAME is not set"
    exit 1
fi

if [ -z "$PROXY_PASSWORD" ]; then
    echo "PROXY_PASSWORD is not set"
    exit 1
fi

cat <<EOF > /squid.conf
http_port ${PORT:-8080}
cache_peer ${PROXY_HOST} parent ${PROXY_PORT} 0 \
  no-query \
  login=${PROXY_USERNAME}:${PROXY_PASSWORD} \
  connect-fail-limit=99999999 \
  proxy-only \
  name=my_peer
cache_peer_access my_peer allow all
EOF

squid -f /squid.conf -N
