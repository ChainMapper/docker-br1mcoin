#!/bin/bash
echo "Docker BR1M wallet

By: Jos Hendriks
GitHub: https://github.com/joshendriks/
Docker: https://hub.docker.com/r/joshendriks/ 

BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk
BR1M: BAbTHLzBmYJrXSRipTnqVvyKieRuVF6qWA"

config="/config/br1m.conf"
if [ -f "$config" ]
then
    echo "Using $config"
    cp $config /data/.br1m/br1m.conf
fi

wallet="/config/wallet.dat"
if [ -f "$wallet" ]
then
    echo "Using $wallet"
    cp $wallet /data/.br1m/wallet.dat
fi

echo "Starting BR1M daemon..."
br1md