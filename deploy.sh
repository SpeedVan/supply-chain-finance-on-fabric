#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)
REMOTE_MOUNT_PATH=/mnt/10-121-40-48/gyl/
sudo mkdir -p ${REMOTE_MOUNT_PATH}
sudo cp -r base ${REMOTE_MOUNT_PATH}

# # orderer
# ORDERER_SOURCEPATH=${CUR_DIR}/gyl_orderer
# ORDERER_DATAPATH=${REMOTE_MOUNT_PATH}/gyl_orderer
# sudo mkdir -p ${ORDERER_DATAPATH}
# sudo cp -r ${ORDERER_SOURCEPATH}/cert ${ORDERER_DATAPATH}
# sudo cp -r ${ORDERER_SOURCEPATH}/config ${ORDERER_DATAPATH}
# sudo cp -r ${ORDERER_SOURCEPATH}/genesis_block ${ORDERER_DATAPATH}
# sudo cp -r ${ORDERER_SOURCEPATH}/sbin ${ORDERER_DATAPATH}

# # core
CORE_SOURCEPATH=${CUR_DIR}/gyl_core_org1
CORE_DATAPATH=${REMOTE_MOUNT_PATH}/gyl_core_org1
sudo mkdir -p ${CORE_DATAPATH}
# sudo cp -r ${CORE_SOURCEPATH}/config ${CORE_DATAPATH}
# sudo cp -r ${CORE_SOURCEPATH}/cert ${CORE_DATAPATH}
# sudo cp -r ${CORE_SOURCEPATH}/channel1-chaincode ${CORE_DATAPATH}
sudo cp -r ${CORE_SOURCEPATH}/sbin ${CORE_DATAPATH}

# # f1
# F1_SOURCEPATH=${CUR_DIR}/gyl_f_org1
# F1_DATAPATH=${REMOTE_MOUNT_PATH}/gyl_f_org1
# sudo mkdir -p ${F1_DATAPATH}
# sudo cp -r ${F1_SOURCEPATH}/cert ${F1_DATAPATH}
# sudo cp -r ${F1_SOURCEPATH}/channel1-chaincode ${F1_DATAPATH}
# sudo cp -r ${F1_SOURCEPATH}/config ${F1_DATAPATH}
# sudo cp -r ${F1_SOURCEPATH}/sbin ${F1_DATAPATH}

# # s1
# S1_SOURCEPATH=${CUR_DIR}/gyl_s_org1
# S1_DATAPATH=${REMOTE_MOUNT_PATH}/gyl_s_org1
# sudo mkdir -p ${S1_DATAPATH}
# sudo cp -r ${S1_SOURCEPATH}/cert ${S1_DATAPATH}
# sudo cp -r ${S1_SOURCEPATH}/config ${S1_DATAPATH}
# sudo cp -r ${S1_SOURCEPATH}/sbin ${S1_DATAPATH}

# # s2
# S2_SOURCEPATH=${CUR_DIR}/gyl_s_org2
# S2_DATAPATH=${REMOTE_MOUNT_PATH}/gyl_s_org2
# sudo mkdir -p ${S2_DATAPATH}
# sudo cp -r ${S2_SOURCEPATH}/cert ${S2_DATAPATH}
# sudo cp -r ${S2_SOURCEPATH}/config ${S2_DATAPATH}
# sudo cp -r ${S2_SOURCEPATH}/sbin ${S2_DATAPATH}

# # explorer
# EXPLORER_SOURCEPATH=${CUR_DIR}/explorer
# EXPLORER_DATAPATH=${REMOTE_MOUNT_PATH}/explorer
# sudo mkdir -p ${EXPLORER_DATAPATH}/config
# sudo mkdir -p ${EXPLORER_DATAPATH}/db
# sudo cp -r ${EXPLORER_SOURCEPATH}/config/* ${EXPLORER_DATAPATH}/config