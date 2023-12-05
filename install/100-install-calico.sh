#!/bin/bash

source .env

# Download Calico AirGap
wget https://raw.githubusercontent.com/projectcalico/calico/${CALICO_VERSION}/manifests/calico.yaml -O ${TEMP_DIR}/calico.yaml
CALICO_IMAGES=( cni node kube-controllers )
for CALICO_IMAGE in "${CALICO_IMAGES[@]}"
do
  crane pull docker.io/calico/${CALICO_IMAGE}:${CALICO_VERSION} ${TEMP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar
  sudo k3s ctr images import ${TEMP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar
done

wget https://github.com/projectcalico/calico/releases/download/v3.26.4/calicoctl-linux-amd64 -O ${TEMP_DIR}/calicoctl
sudo cp ${TEMP_DIR}/calicoctl /usr/local/bin/calicoctl
sudo chmod 755 /usr/local/bin/calicoctl

# Install Calico
kubectl apply -f ${TEMP_DIR}/calico.yaml
