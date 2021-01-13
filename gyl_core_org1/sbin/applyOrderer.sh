
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

ORG=gyl_core_org1

APPLY_PATH=${CUR_DIR}/../../gyl_orderer/apply

mkdir -p ${APPLY_PATH}/${ORG}
cp ${CUR_DIR}/../config/configtx_org.json ${APPLY_PATH}/${ORG}/configtx_org.json