#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CORE_PEER_TLS_ENABLED=true \
CORE_PEER_LOCALMSPID="GylFOrg1MSP" \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/f1.core.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/users/Admin@f1.supply.com/msp \
CORE_PEER_ADDRESS=peer0.f1.supply.com:7051 \
peer channel signconfigtx -f $1