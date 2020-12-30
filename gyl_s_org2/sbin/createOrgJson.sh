#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

FABRIC_CFG_PATH=${CUR_DIR}/../config \
configtxgen -printOrg GylSOrg2MSP > ${CUR_DIR}/../config/configtx_org.json
