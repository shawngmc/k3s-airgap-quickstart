#!/bin/bash

source "${GAP_DIR}/.env"

K9S_VERSION=$(curl -s "https://api.github.com/repos/derailed/k9s/releases/latest" | jq -r '.tag_name')

cat << EOF >> "${GAP_DIR}/.env"
K9S_VERSION=${K9S_VERSION}
EOF
