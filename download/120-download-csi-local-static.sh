#!/bin/bash

source "$GAP_DIR/.env"

# Download CSI Local Static Provisioner Chart
helm pull https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner/local-static-provisioner --version ${CSI_LOCAL_STATIC_VERSION} -d $GAP_DIR/csi-local-static/
echo "https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner/local-static-provisioner:${CSI_LOCAL_STATIC_VERSION}" >> ${GAP_DIR}/urls.txt

# Download CSI Local Static Provisioner images
${GAP_DIR}/temp/crane pull "${CSI_LOCAL_STATIC_IMAGE}" ${GAP_DIR}/csi-local-static/local-volume-provisioner-${CSI_LOCAL_STATIC_IMAGE_VERSION}.tar
echo "${CSI_LOCAL_STATIC_IMAGE}" >> ${GAP_DIR}/urls.txt
