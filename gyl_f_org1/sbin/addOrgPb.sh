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
peer channel fetch config ${CUR_DIR}/../config/chn_config_block.pb -o orderer0.supply.com:7050 -c ${CHANNEL_NAME} --tls --cafile ${ORDERER_CA}

echo create pb.file
# chn_config_block.pb -> chn_config_block.json -> chn_config.json
configtxlator proto_decode --input ${CUR_DIR}/../config/chn_config_block.pb  --type common.Block | jq .data.data[0].payload.data.config > ${CUR_DIR}/../config/chn_config.json
# configtxlator proto_decode --input ${CUR_DIR}/../config/chn_config_block.pb  --type common.Block > ${CUR_DIR}/../config/chn_config_block.json
# jq .data.data[0].payload.data.config ${CUR_DIR}/../config/chn_config_block.json > ${CUR_DIR}/../config/chn_config.json

# sth.json + chn_config.json -> chn_config_modified.json
jq -s '.[0] * {"channel_group":{"groups":{"Application":{"groups": {"'${ORG_MSPID}'":.[1]}}}}}' ${CUR_DIR}/../config/chn_config.json ${CUR_DIR}/../apply/${ORG_FOLDER_NAME}/configtx_org.json > ${CUR_DIR}/../config/chn_config_modified.json

# chn_config.json -> chn_config.pb
# chn_config_modified.json -> chn_config_modified.pb
# chn_config_modified.pb - chn_config.pb -> chn_update.pb
# chn_update.pb -> chn_update.json
configtxlator proto_encode --input ${CUR_DIR}/../config/chn_config.json --type common.Config --output ${CUR_DIR}/../config/chn_config.pb
configtxlator proto_encode --input ${CUR_DIR}/../config/chn_config_modified.json --type common.Config --output ${CUR_DIR}/../config/chn_config_modified.pb
configtxlator compute_update --channel_id ${CHANNEL_NAME} --original ${CUR_DIR}/../config/chn_config.pb --updated ${CUR_DIR}/../config/chn_config_modified.pb --output ${CUR_DIR}/../config/chn_update.pb
configtxlator proto_decode --input ${CUR_DIR}/../config/chn_update.pb --type common.ConfigUpdate --output ${CUR_DIR}/../config/chn_update.json

# sth.json + chn_update.json -> chn_update_in_envelope.json
# chn_update_in_envelope.json -> chn_update_in_envelope.pb
echo '{"payload":{"header":{"channel_header":{"channel_id":"'${CHANNEL_NAME}'", "type":2}},"data":{"config_update":'$(cat ${CUR_DIR}/../config/chn_update.json)'}}}' | jq . > ${CUR_DIR}/../config/chn_update_in_envelope.json
configtxlator proto_encode --input ${CUR_DIR}/../config/chn_update_in_envelope.json --type common.Envelope --output ${CUR_DIR}/../config/chn_update_in_envelope.pb



