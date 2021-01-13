
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

ORG=$1

APPLY_PATH=/mnt/10-121-40-48/gyl/gyl_orderer/apply

sudo mkdir -p ${APPLY_PATH}/${ORG}
sudo cp ${CUR_DIR}/${ORG}/config/configtx_org.json ${APPLY_PATH}/${ORG}/configtx_org.json