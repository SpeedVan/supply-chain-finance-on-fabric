#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=channel2

echo create tx file

FABRIC_CFG_PATH=${CUR_DIR}/../config configtxgen -profile Channel2 -outputCreateChannelTx ${CUR_DIR}/../channel_artifacts/${CHANNEL_NAME}.tx -channelID ${CHANNEL_NAME}
