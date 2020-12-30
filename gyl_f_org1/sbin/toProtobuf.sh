#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

configtxlator proto_encode --input config.json --type common.Config --output config.pb

configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb

configtxlator compute_update --channel_id channel1 --original config.pb --updated modified_config.pb --output forg1_update.pb

configtxlator proto_decode --input forg1_update.pb --type common.ConfigUpdate | jq . > forg1_update.json

echo '{"payload":{"header":{"channel_header":{"channel_id":"channel1", "type":2}},"data":{"config_update":'$(cat forg1_update.json)'}}}' | jq . > forg1_update_in_envelope.json

configtxlator proto_encode --input forg1_update_in_envelope.json --type common.Envelope --output forg1_update_in_envelope.pb