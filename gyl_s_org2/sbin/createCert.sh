#!/bin/sh

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)
cryptogen generate --config=${CUR_DIR}/../config/crypto-config.yaml --output="${CUR_DIR}/../cert"