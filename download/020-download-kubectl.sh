#!/bin/bash

source "$GAP_DIR/.env"

# Download Kubectl
KUBECTL_URL="https://dl.k8s.io/release/v${K8S_VERSION}/bin/linux/amd64/kubectl"
echo "${KUBECTL_URL}" >> ${GAP_DIR}/urls.txt
wget "${KUBECTL_URL}" -O ${GAP_DIR}/kubectl

# Temp Install Kubectl
sudo cp ${GAP_DIR}/kubectl ${GAP_DIR}/temp/
sudo chmod 755 ${GAP_DIR}/temp/kubectl
