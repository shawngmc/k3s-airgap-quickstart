#!/bin/bash

source .env

# Download Crane
wget "https://github.com/google/go-containerregistry/releases/download/${CRANE_VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz" -O ${GAP_DIR}/go-containerregistry.tar.gz

# Temp Install Crane
sudo tar -zxvf ${GAP_DIR}/go-containerregistry.tar.gz -C ${GAP_DIR}/temp crane
sudo chmod 755 ${GAP_DIR}/temp/crane
