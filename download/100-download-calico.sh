#!/bin/bash

source "$GAP_DIR/.env"

# Download Calico AirGap
YAML_URL="https://raw.githubusercontent.com/projectcalico/calico/${CALICO_VERSION}/manifests/calico.yaml"
wget "${YAML_URL}" -O ${GAP_DIR}/calico.yaml
echo "${YAML_URL}" >> ${GAP_DIR}/urls.txt

CALICO_IMAGES=( cni node kube-controllers )
for CALICO_IMAGE in "${CALICO_IMAGES[@]}"
do
  IMAGE_URL="docker.io/calico/${CALICO_IMAGE}:${CALICO_VERSION}"
  ${GAP_DIR}/temp/crane pull "${IMAGE_URL}" ${GAP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar
  echo "${IMAGE_URL}" >> ${GAP_DIR}/urls.txt
done

# Download Calicoctl
EXEC_URL="https://github.com/projectcalico/calico/releases/download/v3.26.4/calicoctl-linux-amd64"
wget "${EXEC_URL}" -O ${GAP_DIR}/calicoctl
echo "${EXEC_URL}" >> ${GAP_DIR}/urls.txt
