#!/bin/bash

source .env

# Download Crane
wget "https://github.com/google/go-containerregistry/releases/download/${CRANE_VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz" -O ${TEMP_DIR}/go-containerregistry.tar.gz

# Install Crane
sudo tar -zxvf ${TEMP_DIR}/go-containerregistry.tar.gz -C /usr/local/bin/ crane
sudo chmod 755 /usr/local/bin/crane
