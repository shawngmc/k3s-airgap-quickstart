#!/bin/bash

source .env

# Download Helm
wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O ${GAP_DIR}/helm-${HELM_VERSION}-linux-amd64.tar.gz

