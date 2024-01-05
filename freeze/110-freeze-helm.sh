#!/bin/bash

source "${GAP_DIR}/.env" 

HELM_VERSION=$(curl -s "https://api.github.com/repos/helm/helm/releases/latest" | jq -r '.tag_name')

cat << EOF >> "${GAP_DIR}/.env"
HELM_VERSION=${HELM_VERSION}
EOF
