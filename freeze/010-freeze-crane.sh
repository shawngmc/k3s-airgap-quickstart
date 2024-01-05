#!/bin/bash

source "${GAP_DIR}/.env" 

CRANE_VERSION=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')

cat << EOF >> "${GAP_DIR}/.env"
CRANE_VERSION=${CRANE_VERSION}
EOF
