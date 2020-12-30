#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

sudo /usr/local/bin/hyperledger/fabric/bin/configtxgen -inspectBlock /mnt/10-121-40-48/gyl/gyl_core_org1/channel_artifacts/mychannel.block
