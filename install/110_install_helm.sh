#!/bin/bash

source .env

wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O ${TEMP_DIR}/helm-${HELM_VERSION}-linux-amd64.tar.gz
sudo tar -zxvf ${TEMP_DIR}/helm-${HELM_VERSION}-linux-amd64.tar.gz --strip-components=1 -C /usr/local/bin/ linux-amd64/helm
sudo chmod 755 /usr/local/bin/helm
