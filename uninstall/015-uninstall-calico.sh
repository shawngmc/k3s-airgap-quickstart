#!/bin/bash

source .env

# Uninstall Calico
kubectl delete -f ${GAP_DIR}/calico.yaml

# Clean up CNI - see https://stackoverflow.com/questions/61672804/after-uninstalling-calico-new-pods-are-stuck-in-container-creating-state
sudo rm -rf /etc/cni/net.d/calico-kubeconfig
sudo rm -rf /etc/cni/net.d/10-calico.conflist
