# docker-br1mcoin
Wallet and daemon for Br1mCoin [BR1M] cryptocurrency on docker

# Quickstart
Type `docker run -it joshendriks/br1m` and see the wallet starting.

```
Docker BR1M wallet

By: Jos Hendriks
GitHub: https://github.com/joshendriks/
Docker: https://hub.docker.com/r/joshendriks/

BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk
BR1M: BAbTHLzBmYJrXSRipTnqVvyKieRuVF6qWA

Starting BR1M daemon...
```

# Proper start
Use a volume to store all data. The image stores it's data in `/data`. So mapping that volume will do the trick.

Additionally you can override the confdig and wallet file  duing volumes pointing to `/config/br1m.conf` and `/config/wallet.data`

# Donations:
BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk

BR1M: BAbTHLzBmYJrXSRipTnqVvyKieRuVF6qWA

# License
MIT, see LICENSE file