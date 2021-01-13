
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

configtxlator proto_decode --input ${CUR_DIR}/../config/config_block.pb --type common.Block | jq .data.data[0].payload.data.config > ${CUR_DIR}/../config/config.json