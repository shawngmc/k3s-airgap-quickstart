#!/bin/bash

mkdir -pv "${GAP_DIR}"

cat << EOF >> "${GAP_DIR}/.env"
K8S_VERSION="1.27.11"
EOF
