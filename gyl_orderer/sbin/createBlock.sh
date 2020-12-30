#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)
echo FABRIC_CFG_PATH=${CUR_DIR}/../../base/fabric/configtx
FABRIC_CFG_PATH=${CUR_DIR}/../../base/fabric/configtx configtxgen -profile OrdererGenesis -channelID system-channel -outputBlock ${CUR_DIR}/../genesis_block/genesis.block