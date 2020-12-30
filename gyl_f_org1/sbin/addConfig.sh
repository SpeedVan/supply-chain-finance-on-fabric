#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

jq -s '.[0] * {"channel_group":{"groups":{"Application":{"groups": {"GylFOrg1MSP":.[1]}}}}}' config.json ${CUR_DIR}/../cert/peerOrganizations/f1.supply.com/forg1.json > modified_config.json