#!/bin/bash

mkdir -pv "${GAP_DIR}"

cat << EOF > "${GAP_DIR}/.env"
KUBECONFIG=/etc/rancher/k3s/k3s.yaml
OS=Linux
ARCH=x86_64
EOF
