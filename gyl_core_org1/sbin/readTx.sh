#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

configtxgen -inspectChannelCreateTx ${CUR_DIR}/../channel_artifacts/channel1.tx