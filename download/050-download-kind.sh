#!/bin/bash

source "$GAP_DIR/.env"

# Download Kind
EXEC_URL="https://github.com/kubernetes-sigs/kind/releases/download/v${KIND_VERSION}/kind-linux-amd64"
wget "${EXEC_URL}" -O $GAP_DIR/kind
echo "${EXEC_URL}" >> ${GAP_DIR}/urls.txt

# Download Kind images
IMAGE_URL="docker.io/${KIND_IMAGE}"
${GAP_DIR}/temp/crane pull "${IMAGE_URL}" ${GAP_DIR}/kind-${K8S_VERSION}-${KIND_IMAGE_HASH}.tar
echo "${IMAGE_URL}" >> ${GAP_DIR}/urls.txt
