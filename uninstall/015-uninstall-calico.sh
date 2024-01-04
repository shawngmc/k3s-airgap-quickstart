#!/bin/bash

source ${GAP_DIR}/.env

# Uninstall Calico
kubectl delete -f ${GAP_DIR}/calico.yaml

# Clean up CNI - see https://stackoverflow.com/questions/61672804/after-uninstalling-calico-new-pods-are-stuck-in-container-creating-state
sudo rm -rf /etc/cni/net.d/calico-kubeconfig
sudo rm -rf /etc/cni/net.d/10-calico.conflist

# Remove images
CALICO_IMAGES=( cni node kube-controllers )
for CALICO_IMAGE in "${CALICO_IMAGES[@]}"
do
  sudo k3s ctr images del docker.io/calico/${CALICO_IMAGE}:${CALICO_VERSION}
done
