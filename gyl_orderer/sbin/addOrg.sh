CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)


CHANNEL_NAME=system-channel

ORG_FOLDER_NAME=$1
ORG_MSPID=$2

ORDERER_CA=${CUR_DIR}/../cert/ordererOrganizations/supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem
# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="GylCoreOrg1MSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/peers/peer0.core.supply.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/peerOrganizations/core.supply.com/users/Admin@core.supply.com/msp
# export CORE_PEER_ADDRESS=peer0.core.supply.com:7051

# 以Orderer身份执行指令
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="OrdererMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${CUR_DIR}/../cert/ordererOrganizations/supply.com/msp/tlscacerts/tlsca.supply.com-cert.pem
export CORE_PEER_MSPCONFIGPATH=${CUR_DIR}/../cert/ordererOrganizations/supply.com/users/Admin@supply.com/msp

export FABRIC_CFG_PATH=${CUR_DIR}/../../base/fabric/config

peer channel fetch config ${CUR_DIR}/../config/sys_config_block.pb -o orderer0.supply.com:7050 -c ${CHANNEL_NAME} --tls --cafile ${ORDERER_CA}

# sys_config_block.pb -> sys_config_block.json -> sys_config.json
configtxlator proto_decode --input ${CUR_DIR}/../config/sys_config_block.pb  --type common.Block | jq .data.data[0].payload.data.config > ${CUR_DIR}/../config/sys_config.json
# configtxlator proto_decode --input ${CUR_DIR}/../config/sys_config_block.pb  --type common.Block > ${CUR_DIR}/../config/sys_config_block.json
# jq .data.data[0].payload.data.config ${CUR_DIR}/../config/sys_config_block.json > ${CUR_DIR}/../config/sys_config.json

# sth.json + sys_config.json -> sys_config_modified.json
jq -s '.[0] * {"channel_group":{"groups":{"Consortiums":{"groups": {"example": {"groups": {"'${ORG_MSPID}'":.[1]}}}}}}}' ${CUR_DIR}/../config/sys_config.json ${CUR_DIR}/../../${ORG_FOLDER_NAME}/config/configtx_org.json > ${CUR_DIR}/../config/sys_config_modified.json

# sys_config.json -> sys_config.pb
# sys_config_modified.json -> sys_config_modified.pb
# sys_config_modified.pb - sys_config.pb -> sys_update.pb
# sys_update.pb -> sys_update.json
configtxlator proto_encode --input ${CUR_DIR}/../config/sys_config.json --type common.Config --output ${CUR_DIR}/../config/sys_config.pb
configtxlator proto_encode --input ${CUR_DIR}/../config/sys_config_modified.json --type common.Config --output ${CUR_DIR}/../config/sys_config_modified.pb
configtxlator compute_update --channel_id ${CHANNEL_NAME} --original ${CUR_DIR}/../config/sys_config.pb --updated ${CUR_DIR}/../config/sys_config_modified.pb --output ${CUR_DIR}/../config/sys_update.pb
configtxlator proto_decode --input ${CUR_DIR}/../config/sys_update.pb --type common.ConfigUpdate --output ${CUR_DIR}/../config/sys_update.json

# sth.json + sys_update.json -> sys_update_in_envelope.json
# sys_update_in_envelope.json -> sys_update_in_envelope.pb
echo '{"payload":{"header":{"channel_header":{"channel_id":"'${CHANNEL_NAME}'", "type":2}},"data":{"config_update":'$(cat ${CUR_DIR}/../config/sys_update.json)'}}}' | jq . > ${CUR_DIR}/../config/sys_update_in_envelope.json
configtxlator proto_encode --input ${CUR_DIR}/../config/sys_update_in_envelope.json --type common.Envelope --output ${CUR_DIR}/../config/sys_update_in_envelope.pb

# update orderer config
peer channel update -f ${CUR_DIR}/../config/sys_update_in_envelope.pb -c ${CHANNEL_NAME} -o orderer0.supply.com:7050 --tls true --cafile ${ORDERER_CA}