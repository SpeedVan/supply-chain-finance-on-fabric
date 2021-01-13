#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=$1

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="GylCoreOrg1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/users/Admin@core.supply.com/msp
export CORE_PEER_ADDRESS=peer0.core.supply.com:7051

FABRIC_CFG_PATH=${CUR_DIR}/../config \
peer channel fetch config ${CUR_DIR}/../config/config_block.pb -o orderer0.supply.com:7050 -c ${CHANNEL_NAME} --tls --cafile ${CUR_DIR}/../cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem
# ${CUR_DIR}/../channel_artifacts/${CHANNEL_NAME}.block
# peer channel join -b ${CUR_DIR}/../channel_artifacts/${CHANNEL_NAME}.block