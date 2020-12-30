#!/bin/sh
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_LOCALMSPID="GylCoreOrg1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/users/Admin@core.supply.com/msp
export CORE_PEER_ADDRESS=peer0.core.supply.com:7051

peer channel update -f forg1_update_in_envelope.pb -c channel1 -o orderer0.supply.com:7050 --tls --cafile ${CUR_DIR}/../cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem