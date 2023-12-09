#!/bin/bash

source .env

# TODO: Check ISCSI dependency

# Stage Longhorn Images
for LONGHORN_IMAGE in ${GAP_DIR}/longhornio-*.tar; do
    sudo k3s ctr images import ${LONGHORN_IMAGE}
done

# Stage chart
cd $GAP_DIR
tar -zxf longhorn-chart-${LONGHORN_VERSION}.tgz

# Install chart
kubectl create namespace longhorn-system
helm install longhorn $GAP_DIR/longhorn --namespace longhorn-system
