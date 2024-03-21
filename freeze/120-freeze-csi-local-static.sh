#!/bin/bash

source "${GAP_DIR}/.env" 

CSI_LOCAL_STATIC_VERSION=$(helm show chart https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner/local-static-provisioner | yq -r .version)

cat << EOF >> "${GAP_DIR}/.env"
CSI_LOCAL_STATIC_VERSION=${CSI_LOCAL_STATIC_VERSION}
EOF
