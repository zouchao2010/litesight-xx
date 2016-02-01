#!/usr/bin/env bash

litecoind -rpcuser=liteuser -rpcpassword=litepass -server=1 -daemon=1 -txindex=1 -listen=1
INSIGHT_PORT=4001 INSIGHT_NETWORK=livenet npm start | tee -a testnet.log
