#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=channel1
CC_PACKAGE_ID=$1

msg=$(
FABRIC_LOGGING_SPEC="DEBUG" \
FABRIC_CFG_PATH=${CUR_DIR}/../config \
CORE_PEER_TLS_ENABLED=true \
CORE_PEER_LOCALMSPID="GylFOrg1MSP" \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/users/Admin@f1.supply.com/msp \
CORE_PEER_ADDRESS=peer0.f1.supply.com:7051 \
peer lifecycle chaincode queryinstalled)

echo ${msg} # return