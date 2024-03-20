#!/bin/bash

source ${GAP_DIR}/.env



echo "Staging kind executable..."
sudo cp ${GAP_DIR}/kind /usr/local/bin/kind
sudo chmod 755 /usr/local/bin/kind
kind --version

echo "Staging kind image..."
docker load -i ${GAP_DIR}/kind-${K8S_VERSION}-${KIND_IMAGE_HASH}.tar

echo "Installing k3s airgap..."
kind create cluster \
  --wait 60 \
  --image=${KIND_IMAGE}
