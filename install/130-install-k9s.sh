#!/bin/bash
source ${GAP_DIR}/.env

echo "Staging k3s executable..."
sudo tar -zxvf ${GAP_DIR}/k9s-${K9S_VERSION}-linux-amd64.tar.gz -C /usr/local/bin/ k9s
sudo chmod 755 /usr/local/bin/k9s
