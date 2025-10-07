#!/bin/bash
set -euo pipefail

cd /app/bin

external_address="${EXTERNAL_ADDRESS:-:3232}"

WAIT_CMD=(/app/wait-for-it.sh -t 0 flask:5000 -- ./server --datadir /data --enable-client-downloads --external_address "${external_address}")

if [ -d "/data/tls" ] && [ -f "/data/tls/tls.cert" ] && [ -f "/data/tls/tls.key" ]; then
    exec "${WAIT_CMD[@]}" --tls --tlscert /data/tls/tls.cert --tlskey /data/tls/tls.key
else
    exec "${WAIT_CMD[@]}" --tls
fi
