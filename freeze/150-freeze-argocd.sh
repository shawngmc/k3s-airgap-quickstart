#!/bin/bash

source "${GAP_DIR}/.env" 

BITNAMI_ARGOCD_VERSION=$(helm show chart oci://registry-1.docker.io/bitnamicharts/argo-cd | yq -r .version)

cat << EOF >> "${GAP_DIR}/.env"
BITNAMI_ARGOCD_VERSION=${BITNAMI_ARGOCD_VERSION}
EOF
