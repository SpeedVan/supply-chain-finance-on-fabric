
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

# ORG=gyl_core_org1
ApplyOrg=gyl_core_org1
ApproveOrg=$1

APPLY_PATH=${CUR_DIR}/../../${ApproveOrg}/apply

mkdir -p ${APPLY_PATH}/${ApplyOrg}
cp ${CUR_DIR}/../config/configtx_org.json ${APPLY_PATH}/${ApplyOrg}/configtx_org.json