
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

FROOT=${CUR_DIR}/../../../

ORDERERSBIN=${FROOT}/gyl_orderer/sbin/
CORESBIN=${FROOT}/gyl_core_org1/sbin/
FSBIN=${FROOT}/gyl_f_org1/sbin/

# apply
sh ${CORESBIN}/apply.sh gyl_orderer
# approve
sh ${ORDERERSBIN}/addOrg.sh gyl_core_org1 GylCoreOrg1MSP

# add & join channel
sh ${CORESBIN}/createChannelTx.sh
sh ${CORESBIN}/createChannel.sh
sh ${CORESBIN}/joinChannel.sh channel1

# apply for channel
sh ${FSBIN}/apply.sh gyl_core_org1
# approve
sh ${CORESBIN}/addOrgPb.sh gyl_f_org1 GylFOrg1MSP
sh ${CORESBIN}/addOrg.sh gyl_f_org1 GylFOrg1MSP

# join channel
sh ${FSBIN}/joinChannel channel1