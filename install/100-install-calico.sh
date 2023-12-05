#!/bin/bash

source .env

# Stage Calico AirGap
CALICO_IMAGES=( cni node kube-controllers )
for CALICO_IMAGE in "${CALICO_IMAGES[@]}"
do
  sudo k3s ctr images import ${GAP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar
done

# Stage calicoctl
sudo cp ${GAP_DIR}/calicoctl /usr/local/bin/calicoctl
sudo chmod 755 /usr/local/bin/calicoctl

# Install Calico
kubectl apply -f ${GAP_DIR}/calico.yaml
