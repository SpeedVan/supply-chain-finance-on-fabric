#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

mkdir -p /opt/explorer/app/platform/fabric/
mkdir -p /tmp/

mv /opt/explorer/app/platform/fabric/config.json /opt/explorer/app/platform/fabric/config.json.bak
cp ${CUR_DIR}/config.json /opt/explorer/app/platform/fabric/config.json

cd /opt/explorer
node $EXPLORER_APP_PATH/main.js && tail -f /dev/null