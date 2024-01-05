#!/bin/bash

source "$GAP_DIR/.env"

# Download Helm
HELM_EXEC_URL="https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz"
wget "${HELM_EXEC_URL}" -O ${GAP_DIR}/helm-${HELM_VERSION}-linux-amd64.tar.gz
echo "${HELM_EXEC_URL}" >> ${GAP_DIR}/urls.txt
