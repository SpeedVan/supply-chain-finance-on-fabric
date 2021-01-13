#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=channel2
# echo create channel

export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_LOCALMSPID="GylFOrg1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/users/Admin@f1.supply.com/msp
export CORE_PEER_ADDRESS=peer0.f1.supply.com:7051

# FABRIC_CFG_PATH=${CUR_DIR}/../config \
# peer channel create -o orderer0.supply.com:7050 -c $CHANNEL_NAME -f ${CUR_DIR}/../channel_artifacts/${CHANNEL_NAME}.tx
FABRIC_CFG_PATH=${CUR_DIR}/../config \
peer channel create -o orderer0.supply.com:7050 -c ${CHANNEL_NAME} --ordererTLSHostnameOverride orderer0.supply.com -f ${CUR_DIR}/../channel_artifacts/${CHANNEL_NAME}.tx --outputBlock ${CUR_DIR}/../channel_artifacts/${CHANNEL_NAME}.block --tls --cafile ${CUR_DIR}/../cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem