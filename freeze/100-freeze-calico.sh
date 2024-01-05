#!/bin/bash

source "${GAP_DIR}/.env" 

CALICO_VERSION=v3.26.3

cat << EOF >> "${GAP_DIR}/.env"
CALICO_VERSION=${CALICO_VERSION}
EOF
