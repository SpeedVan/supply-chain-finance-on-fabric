#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CORE_PEER_TLS_ENABLED=true \
CORE_PEER_LOCALMSPID="GylCoreOrg1MSP" \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/users/Admin@core.supply.com/msp \
CORE_PEER_ADDRESS=peer0.core.supply.com:7051 \
peer channel signconfigtx -f forg1_update_in_envelope.pb