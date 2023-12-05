#!/bin/bash

TEMP_DIR=~/tmp/k3s

CRANE_VERSION=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')

# Download Crane
curl -sL "https://github.com/google/go-containerregistry/releases/download/${VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz" > ${TEMP_DIR}/go-containerregistry.tar.gz

# Install Crane
sudo tar -zxvf ${TEMP_DIR}/go-containerregistry.tar.gz -C /usr/local/bin/ crane
sudo chmod 755 /usr/local/bin/crane
