#!/bin/bash

source .env

# Download Calico AirGap
wget https://raw.githubusercontent.com/projectcalico/calico/${CALICO_VERSION}/manifests/calico.yaml -O ${GAP_DIR}/calico.yaml
CALICO_IMAGES=( cni node kube-controllers )
for CALICO_IMAGE in "${CALICO_IMAGES[@]}"
do
  ${GAP_DIR}/temp/crane pull docker.io/calico/${CALICO_IMAGE}:${CALICO_VERSION} ${GAP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar
done

# Download Calicoctl
wget https://github.com/projectcalico/calico/releases/download/v3.26.4/calicoctl-linux-amd64 -O ${GAP_DIR}/calicoctl
