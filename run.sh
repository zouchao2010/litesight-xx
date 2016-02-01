#!/usr/bin/env bash

if [[ $TESTNET -eq 1 ]];
then
    echo testnet
    litecoind -rpcuser=liteuser -rpcpassword=litepass -server=1 -daemon=1 -txindex=1 -listen=1 -testnet
    sleep 10
    INSIGHT_PORT=4001 INSIGHT_NETWORK=testnet npm start | tee -a testnet.log
else
    echo livenet
    litecoind -rpcuser=liteuser -rpcpassword=litepass -server=1 -daemon=1 -txindex=1 -listen=1
    sleep 10
    INSIGHT_PORT=4001 INSIGHT_NETWORK=livenet npm start | tee -a livenet.log
fi

#ps -ef|grep litecoind|grep -v grep |awk '{print $2}'|grep -v PID|xargs kill -9
