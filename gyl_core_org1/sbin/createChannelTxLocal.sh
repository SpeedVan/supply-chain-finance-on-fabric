#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

# CHANNEL_NAME=$1

echo create tx file
# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="OrdererMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../../gyl_orderer/cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem
# export CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../../gyl_orderer/cert/ordererOrganizations/supply.com/users/Admin@example/msp

FABRIC_CFG_PATH=${CUR_DIR}/../config configtxgen -profile CoreFOrg1Channel -outputCreateChannelTx ${CUR_DIR}/../channel_artifacts/channel1.tx -channelID channel1
