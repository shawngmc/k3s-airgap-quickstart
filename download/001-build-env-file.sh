#!/bin/bash

source .env

mkdir -pv ${GAP_DIR}/temp

sudo tee "${GAP_DIR}/.env" > /dev/null <<'EOF'
GAP_DIR=../gapfiles
OS=Linux
ARCH=x86_64
CRANE_VERSION=$(CRANE_VERSION)
K3S_VERSION=v1.28.3\%2Bk3s2
CALICO_VERSION=v3.26.3
HELM_VERSION=$(HELM_VERSION)
EOF