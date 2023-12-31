#!/bin/bash

source ${GAP_DIR}/.env

echo "Staging Calico AirGap images..."
CALICO_IMAGES=( cni node kube-controllers )
for CALICO_IMAGE in "${CALICO_IMAGES[@]}"
do
  sudo /usr/local/bin/k3s ctr images import ${GAP_DIR}/calico-${CALICO_IMAGE}-${CALICO_VERSION}.tar
done

echo "Stage calicoctl..."
sudo cp ${GAP_DIR}/calicoctl /usr/local/bin/calicoctl
sudo chmod 755 /usr/local/bin/calicoctl

echo "Installing Calico..."
kubectl apply -f ${GAP_DIR}/calico.yaml
