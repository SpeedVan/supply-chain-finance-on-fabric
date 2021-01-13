#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)
echo FABRIC_CFG_PATH=${CUR_DIR}/../config
FABRIC_CFG_PATH=${CUR_DIR}/../config configtxgen -profile OrdererGenesis -channelID system-channel -outputBlock ${CUR_DIR}/../genesis_block/genesis.block