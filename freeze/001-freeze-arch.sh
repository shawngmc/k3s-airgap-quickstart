#!/bin/bash

mkdir -pv "${GAP_DIR}"

cat << EOF > "${GAP_DIR}/.env"
OS=Linux
ARCH=x86_64
EOF
