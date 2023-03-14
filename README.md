# okp4-node
## Build
        docker build . -t okp4
## Run
        docker run -e NODE_MONIKER="MonPham" -v /mnt/blockstore/opk4:/root/.okp4d --name okp4 okp4

## Snapshot
        docker exec -it okp4 /bin/bash -c 'SNAP_NAME=$(curl -s https://snapshots1-testnet.nodejumper.io/okp4-testnet/info.json | jq -r .fileName) && \
        curl "https://snapshots1-testnet.nodejumper.io/okp4-testnet/${SNAP_NAME}" | lz4 -dc - | tar -xf - -C "$HOME/.okp4d"'
        docker restart okp4
## Docs

1/ base on (nodejumper)[https://nodejumper.io/okp4-testnet/installation]
        
        
