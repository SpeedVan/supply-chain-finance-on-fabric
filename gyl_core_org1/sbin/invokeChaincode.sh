#!/bin/bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

# CHANNEL_NAME=$1

parr=""
if [ $# -ge 1 ]; then
    parr='"'$1'"'
    for i in ${@:2}
    do
        parr=${parr}',"'${i}'"'
    done
fi
echo ${parr}

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
peer chaincode invoke -C channel1 -n ${CCNAME} -c '{"function":"'${FN}'","Args":['${parr}']}' --tls --cafile ${CUR_DIR}/../cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem \
--peerAddresses peer0.core.supply.com:7051 --tlsRootCertFiles ${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/ca.crt \
--peerAddresses peer0.f1.supply.com:7051 --tlsRootCertFiles ${CUR_DIR}/../../gyl_f_org1/cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/ca.crt
# peer chaincode query -C channel1 -n va1 -c '{"Args":["CreateVA", "abced1", "core.supply.com", "f1.supply.com", "25000", "abc", "edf"]}'
# peer chaincode query -C channel1 -n va1 -c '{"Args":["GetAllVA"]}'
