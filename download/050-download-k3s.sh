#!/bin/bash

source "$GAP_DIR/.env"

# Download K3s
EXEC_URL="https://github.com/k3s-io/k3s/releases/download/${K3S_VERSION}/k3s"
wget "${EXEC_URL}" -O $GAP_DIR/k3s
echo "${EXEC_URL}" >> ${GAP_DIR}/urls.txt

IMAGES_URL="${EXEC_URL}-airgap-images-amd64.tar"
wget "${IMAGES_URL}" -O "${GAP_DIR}/k3s-airgap-images-amd64.tar"
echo "${IMAGES_URL}" >> ${GAP_DIR}/urls.txt

INSTALL_SCRIPT_URL="https://get.k3s.io/"
wget "${INSTALL_SCRIPT_URL}" -O ${GAP_DIR}/k3s_install.sh
echo "${INSTALL_SCRIPT_URL}" >> ${GAP_DIR}/urls.txt

SELINUX_SHIMS=( el7 el8 el9 )
for SELINUX_SHIM in "${SELINUX_SHIMS[@]}"
do
  SHIM_URL="https://github.com/k3s-io/k3s-selinux/releases/download/${K3S_SELINUX_TAG}/k3s-selinux-${K3S_SELINUX_VERSION}.${SELINUX_SHIM}.noarch.rpm"
  wget "${SHIM_URL}" -O ${GAP_DIR}/k3s-selinux-${K3S_SELINUX_VERSION}.${SELINUX_SHIM}.noarch.rpm
  echo "${SHIM_URL}" >> ${GAP_DIR}/urls.txt
done
