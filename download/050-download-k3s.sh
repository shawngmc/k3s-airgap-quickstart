#!/bin/bash

source .env

# Download K3s
wget https://github.com/k3s-io/k3s/releases/download/${K3S_VERSION}/k3s -O $GAP_DIR/k3s
wget https://github.com/k3s-io/k3s/releases/download/${K3S_VERSION}/k3s-airgap-images-amd64.tar -O "${GAP_DIR}/k3s-airgap-images-amd64.tar"
wget https://get.k3s.io/ -O ${GAP_DIR}/k3s_install.sh
