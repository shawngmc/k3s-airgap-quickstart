#!/bin/bash

TEMP_DIR=~/tmp/k3s
CALICO_VERSION=v3.26.4

# Download Calico AirGap
wget https://raw.githubusercontent.com/projectcalico/calico/v3.26.4/manifests/calico.yaml -O calico.yaml
CALICO_IMAGES=( cni node kube-controllers )
for $CALICO_IAMGE in "${CALICO_IMAGES[@]}"
do
  echo "Value for fruits array is: $value"
  crane pull docker.io/calico/${CALICO_IMAGE}:${CALICO_VERSION} ${TEMP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar.gz
  gzip -d ${TEMP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar.gz  
  kubectl ctr images import ${TEMP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar
done
wget https://github.com/projectcalico/calico/releases/download/v3.26.4/calicoctl-linux-amd64 -O ${TEMP_DIR}/calicoctl
sudo cp ${TEMP_DIR}/calicoctl /usr/local/bin/calicoctl
sudo chmod 755 /usr/local/bin/calicoctl

# Install Calico
kubectl apply -f calico.yaml
