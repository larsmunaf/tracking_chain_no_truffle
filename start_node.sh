#!/bin/bash -v

# if BOOTENODE is not defined create a bootnode and set BOOTENODE
if [ -v $BOOTENODE ];
then
    bootnode -genkey boot_node.key
    IP_ADDRESS=172.17.0.2
    PORT=30303
    #NODEKEY=$(bootnode --nodekey=boot_node.key --writeaddress)
    #export BOOTENODE="enode://$NODEKEY@$IP_ADDRESS:$PORT"
    #echo "enode: ", $BOOTENODE
    bootnode -addr ":$PORT" -nodekey boot_node.key -verbosity 9

# create a normal node otherwise
else
    # initialization of genesis block
    geth --datadir ../tracking_chain/datadir init genesis_block.json
    sleep 2

    ACCOUNT1=$(jq -r ".alloc | keys[0]" genesis_block.json)
    ACCOUNT2=$(jq -r ".alloc | keys[1]" genesis_block.json)

    # start private testnet (--nodiscover)
    cat << EOF | geth --bootnodes "$BOOTENODE" --rpc --rpcapi eth,personal,web3,clique,net,db,miner --networkid 15 --verbosity 5 \
--ws --wsorigins "*" --wsaddr 0.0.0.0 --wsapi eth,personal,web3,clique,net,db,miner \
--unlock "$ACCOUNT1, $ACCOUNT2" \
--cache 512 --datadir ../tracking_chain/datadir \
--gasprice "1" --syncmode "full"
bla
bla
EOF

    sleep 4
    echo "init done!"
fi

sleep 2

##########
# DONE
# Accounts mit jq einfügen (Fehler: Ether waren nicht als String in jq angegeben)
# Mining funds können beliebigen Accounts zugewiesen werden, um diesen zu befüllen
# Chain.js und notifyAgent.js funktionieren parallel auf unterschiedlichen Accounts
# accountid aus "geth account new" greppen und in die genesis_block.json schreiben zum Prefunden
# testNet ist privat
# SmartContract notify.js gitb nichts aus
# README schreiben
# WS statt IPC
# Fehler: Fatal: Error starting protocol stack: listen udp :30303: bind: address already in use => Port ist doch frei, siehe oben im Shellscript??
#   => jedoch: Fehler taucht nicht deterministisch auf
# miner.start() => keine DAG-Berechnung
# POW => POA
##########


##########
# FRAGEN / TODO
# Review des Quellcodes der ÐApp
# Aufsatz schreiben (Latex)
##########