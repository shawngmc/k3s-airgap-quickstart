#!/bin/bash

source ${GAP_DIR}/.env

echo "Staging CSI Local Static Provisioner Images..."
for CSI_IMAGE in ${GAP_DIR}/csi-local-static/*.tar; do
    sudo /usr/local/bin/kind load ${CSI_IMAGE}
done

echo "Staging CSI Local Static Provisioner chart..."
cd $GAP_DIR/csi-local-static/
tar -zxf local-static-provisioner-${CSI_LOCAL_STATIC_VERSION}.tgz

echo "Installing CSI Local Static Provisioner via chart..."
helm install local-static-provisioner $GAP_DIR/csi-local-static/local-static-provisioner/ --namespace kube-system
