#!/bin/bash

source "${GAP_DIR}/.env" 

LONGHORN_TAG=$(curl -s "https://api.github.com/repos/longhorn/charts/releases/latest" | jq -r '.tag_name')
LONGHORN_VERSION=$(echo $LONGHORN_TAG | cut -d "-" -f 2)

cat << EOF >> "${GAP_DIR}/.env"
LONGHORN_TAG=${LONGHORN_TAG}
LONGHORN_VERSION=${LONGHORN_VERSION}
EOF
