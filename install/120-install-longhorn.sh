#!/bin/bash

source ${GAP_DIR}/.env

# TODO: Check ISCSI dependency

echo "Staging Longhorn Images..."
for LONGHORN_IMAGE in ${GAP_DIR}/longhornio-*.tar; do
    sudo /usr/local/bin/k3s ctr images import ${LONGHORN_IMAGE}
done

echo "Staging Longhorn chart..."
cd $GAP_DIR
tar -zxf longhorn-chart-${LONGHORN_VERSION}.tgz

echo "Installing Longhorn via chart..."
kubectl create namespace longhorn-system
helm install longhorn ${GAP_DIR}/longhorn --namespace longhorn-system
