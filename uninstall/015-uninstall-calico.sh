#!/bin/bash

source .env

# Uninstall Calico
kubectl delete -f ${GAP_DIR}/calico.yaml

# Clean up CNI
sudo rm -rf /etc/cni/net.d/*calico*
