#!/bin/bash

source "$GAP_DIR/.env"

EXEC_URL="https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_amd64.tar.gz"
wget "${EXEC_URL}" -O $GAP_DIR/k9s-${K9S_VERSION}-linux-amd64.tar.gz
echo "${EXEC_URL}" >> ${GAP_DIR}/urls.txt
