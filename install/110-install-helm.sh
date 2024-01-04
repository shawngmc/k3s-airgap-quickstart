#!/bin/bash

source ${GAP_DIR}/.env

echo "Staging Helm Executable..."
sudo tar -zxvf ${GAP_DIR}/helm-${HELM_VERSION}-linux-amd64.tar.gz --strip-components=1 -C /usr/local/bin/ linux-amd64/helm
sudo chmod 755 /usr/local/bin/helm
