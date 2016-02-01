#!/usr/bin/env bash

if [ $TESTNET -eq 0 ];
then
    litecoind -rpcuser=liteuser -rpcpassword=litepass -server=1 -daemon=1 -txindex=1 -listen=1
    INSIGHT_PORT=4001 INSIGHT_NETWORK=livenet npm start | tee -a livenet.log
else
    litecoind -rpcuser=liteuser -rpcpassword=litepass -server=1 -daemon=1 -txindex=1 -listen=1 -testnet
    INSIGHT_PORT=4001 INSIGHT_NETWORK=testnet npm start | tee -a testnet.log
fi
