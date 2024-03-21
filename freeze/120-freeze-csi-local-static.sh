#!/bin/bash

source "${GAP_DIR}/.env" 

CSI_LOCAL_STATIC_CHART_VERSION=$(helm show chart https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner/local-static-provisioner | yq -r .version)

# TODO: Pull from image version from chart:values.yaml:images
CSI_LOCAL_STATIC_IMAGE="registry.k8s.io/sig-storage/local-volume-provisioner:v2.6.0"

cat << EOF >> "${GAP_DIR}/.env"
CSI_LOCAL_STATIC_CHART_VERSION=${CSI_LOCAL_STATIC_CHART_VERSION}
CSI_LOCAL_STATIC_IMAGE=${CSI_LOCAL_STATIC_IMAGE}
EOF
