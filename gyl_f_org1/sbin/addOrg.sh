CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

CHANNEL_NAME=channel2

ORG_FOLDER_NAME=$1
ORG_MSPID=$2
ORDERER_CA=${CUR_DIR}/../cert/ordererOrganizations/supply.com/orderers/orderer0.supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem

CORE_PEER_TLS_ENABLED=true \
CORE_PEER_LOCALMSPID="GylFOrg1MSP" \
CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/peers/peer0.f1.supply.com/tls/ca.crt \
CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/users/Admin@f1.supply.com/msp \
CORE_PEER_ADDRESS=peer0.f1.supply.com:7051 \
FABRIC_CFG_PATH=${CUR_DIR}/../config \
peer channel update -f ${CUR_DIR}/../config/chn_update_in_envelope.pb -c ${CHANNEL_NAME} -o orderer0.supply.com:7050 --tls true --cafile ${ORDERER_CA}

