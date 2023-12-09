#!/bin/bash

source .env

# Download Longhorn Chart
CHART_URL="https://github.com/longhorn/charts/releases/download/longhorn-${LONGHORN_VERSION}/longhorn-${LONGHORN_VERSION}.tgz"
wget "${CHART_URL}" -O ${GAP_DIR}/longhorn-chart-${LONGHORN_VERSION}.tgz
echo "${CHART_URL}" >> ${GAP_DIR}/urls.txt

# Download Longhorn images
MAIN_LONGHORN_IMAGES=( longhorn-engine longhorn-manager longhorn-ui longhorn-instance-manager longhorn-share-manager backing-image-manager )
for LONGHORN_IMAGE in "${MAIN_LONGHORN_IMAGES[@]}"
do
  IMAGE_URL="docker.io/longhornio/${LONGHORN_IMAGE}:${LONGHORN_VERSION}"
  ${GAP_DIR}/temp/crane pull "${IMAGE_URL}" ${GAP_DIR}/longhornio-${LONGHORN_IMAGE}-${LONGHORN_VERSION}.tar
  echo "${IMAGE_URL}" >> ${GAP_DIR}/urls.txt
done
# TODO: Figure out how to pull these from 'helm template ./' despite mix of direct image, value and other attribs
OTHER_LONGHORN_IMAGES=( support-bundle-kit:v0.0.27 csi-attacher:v4.2.0 csi-provisioner:v3.4.1 csi-node-driver-registrar:v2.7.0 csi-resizer:v1.7.0 csi-snapshotter:v6.2.1 livenessprobe:v2.9.0 )
for OTHER_LONGHORN_IMAGE in "${OTHER_LONGHORN_IMAGES[@]}"
do
  IMAGE_URL="docker.io/longhornio/${OTHER_LONGHORN_IMAGE}"
  ${GAP_DIR}/temp/crane pull "${IMAGE_URL}" ${GAP_DIR}/longhornio-${OTHER_LONGHORN_IMAGE//:/-}.tar
  echo "${IMAGE_URL}" >> ${GAP_DIR}/urls.txt
done
