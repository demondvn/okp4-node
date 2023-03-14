#!/bin/bash

NODE_MONIKER=$NODE_MONIKER

okp4d version # 3.0.0

okp4d config keyring-backend test
okp4d config chain-id okp4-nemeton-1
okp4d init "$NODE_MONIKER" --chain-id okp4-nemeton-1

curl -s https://raw.githubusercontent.com/okp4/networks/main/chains/nemeton-1/genesis.json > $HOME/.okp4d/config/genesis.json
curl -s https://snapshots1-testnet.nodejumper.io/okp4-testnet/addrbook.json > $HOME/.okp4d/config/addrbook.json

SEEDS=""
PEERS=""
sed -i 's|^seeds *=.*|seeds = "'$SEEDS'"|; s|^persistent_peers *=.*|persistent_peers = "'$PEERS'"|' $HOME/.okp4d/config/config.toml

sed -i 's|^pruning *=.*|pruning = "custom"|g' $HOME/.okp4d/config/app.toml
sed -i 's|^pruning-keep-recent  *=.*|pruning-keep-recent = "100"|g' $HOME/.okp4d/config/app.toml
sed -i 's|^pruning-interval *=.*|pruning-interval = "10"|g' $HOME/.okp4d/config/app.toml
sed -i 's|^snapshot-interval *=.*|snapshot-interval = 0|g' $HOME/.okp4d/config/app.toml

sed -i 's|^minimum-gas-prices *=.*|minimum-gas-prices = "0.0001uknow"|g' $HOME/.okp4d/config/app.toml
sed -i 's|^prometheus *=.*|prometheus = true|' $HOME/.okp4d/config/config.toml



#okp4d tendermint unsafe-reset-all --home $HOME/.okp4d --keep-addr-book




$(which okp4d) start