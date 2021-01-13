#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=$1

mkdir -p ${CUR_DIR}/../channel_artifacts
FABRIC_LOGGING_SPEC="DEBUG" \
FABRIC_CFG_PATH=${CUR_DIR}/../config \
CORE_PEER_ID="GylFOrg1MSP" \
CORE_PEER_LOCALMSPID="GylFOrg1MSP" \
CORE_PEER_TLS_ENABLED="true" \
CORE_PEER_TLS_CERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/server.crt \
CORE_PEER_TLS_KEY_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/server.key \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/users/Admin@f1.supply.com/msp \
CORE_PEER_ADDRESS=peer0.f1.supply.com:7051 \
peer channel fetch 0 ${CUR_DIR}/../channel_artifacts/channel1.block -o orderer0.supply.com:7050 -c channel1 --tls --cafile ${CUR_DIR}/../cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem

FABRIC_LOGGING_SPEC="DEBUG" \
FABRIC_CFG_PATH=${CUR_DIR}/../config \
CORE_PEER_ID="GylFOrg1MSP" \
CORE_PEER_LOCALMSPID="GylFOrg1MSP" \
CORE_PEER_TLS_ENABLED="true" \
CORE_PEER_TLS_CERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/server.crt \
CORE_PEER_TLS_KEY_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/server.key \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/users/Admin@f1.supply.com/msp \
CORE_PEER_ADDRESS=peer0.f1.supply.com:7051 \
peer channel join -b ${CUR_DIR}/../channel_artifacts/channel1.block