#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=$1

FABRIC_LOGGING_SPEC="DEBUG" \
FABRIC_CFG_PATH=${CUR_DIR}/../config \
CORE_PEER_ID="GylCoreOrg1MSP" \
CORE_PEER_LOCALMSPID="GylCoreOrg1MSP" \
CORE_PEER_TLS_ENABLED="true" \
CORE_PEER_TLS_CERT_FILE=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/server.crt \
CORE_PEER_TLS_KEY_FILE=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/server.key \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/users/Admin@core.supply.com/msp \
CORE_PEER_ADDRESS=peer0.core.supply.com:7051 \
peer channel join -b ${CUR_DIR}/../channel_artifacts/${CHANNEL_NAME}.block