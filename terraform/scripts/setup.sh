#!/bin/bash

set -ex

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LAMBDA_DIR="$1"
LAMBDA_PREPARED_DIR="$2"

pushd "${LAMBDA_DIR}"
rm -rf aws_maintenance_lambda-*.tgz
npm pack

pushd "${LAMBDA_PREPARED_DIR}"
rm -rf package/
tar xvf ${LAMBDA_DIR}/aws_maintenance_lambda-*.tgz

pushd package/
npm install --production
