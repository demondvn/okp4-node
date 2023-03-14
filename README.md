# okp4-node
## Build
    docker build . -t okp4
## Run
    docker run -d -e NODE_MONIKER="MonPham" -v /mnt/blockstore/opk4:/root/.okp4d --name okp4 --restart unless-stopped okp4

## Snapshot
    docker stop okp4

    cd /mnt/blockstore/opk4

    
    SNAP_NAME=$(curl -s https://snapshots1-testnet.nodejumper.io/okp4-testnet/info.json | jq -r .fileName) && \
    axel -an 10 "https://snapshots1-testnet.nodejumper.io/okp4-testnet/${SNAP_NAME}" 
    lz4 -dc $SNAP_NAME | tar -xf $SNAP_NAME -C .
    docker restart okp4
## Docs

1/ base on (https://nodejumper.io/okp4-testnet/installation)[nodejumper]
        
        
