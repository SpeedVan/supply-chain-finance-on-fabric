#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=$1
echo fetch num0 file
FABRIC_LOGGING_SPEC="DEBUG" \
FABRIC_CFG_PATH=${CUR_DIR}/../../base/fabric/config \
CORE_PEER_ID="GylSOrg2MSP" \
CORE_PEER_LOCALMSPID="GylSOrg2MSP" \
CORE_PEER_TLS_ENABLED="true" \
CORE_PEER_TLS_CERT_FILE=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/peers/peer0.s2.supply.com/tls/server.crt \
CORE_PEER_TLS_KEY_FILE=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/peers/peer0.s2.supply.com/tls/server.key \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/peers/peer0.s2.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/users/Admin@s2.supply.com/msp \
CORE_PEER_ADDRESS=peer0.s2.supply.com:7051 \
peer channel fetch 0 ${CUR_DIR}/../config/${CHANNEL_NAME}.block -o orderer0.supply.com:7050 -c ${CHANNEL_NAME} --tls --cafile ${CUR_DIR}/../cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem

echo join with file
FABRIC_LOGGING_SPEC="DEBUG" \
FABRIC_CFG_PATH=${CUR_DIR}/../../base/fabric/config \
CORE_PEER_ID="GylSOrg2MSP" \
CORE_PEER_LOCALMSPID="GylSOrg2MSP" \
CORE_PEER_TLS_ENABLED="true" \
CORE_PEER_TLS_CERT_FILE=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/peers/peer0.s2.supply.com/tls/server.crt \
CORE_PEER_TLS_KEY_FILE=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/peers/peer0.s2.supply.com/tls/server.key \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/peers/peer0.s2.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/s2.supply.com/users/Admin@s2.supply.com/msp \
CORE_PEER_ADDRESS=peer0.s2.supply.com:7051 \
peer channel join -b ${CUR_DIR}/../config/${CHANNEL_NAME}.block