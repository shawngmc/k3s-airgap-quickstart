#!/bin/bash

source "$GAP_DIR/.env"

mkdir -pv $GAP_DIR/argocd

# Archive the chart
helm pull oci://registry-1.docker.io/bitnamicharts/argo-cd --version ${BITNAMI_ARGOCD_VERSION} -d $GAP_DIR/argocd/
echo "oci://registry-1.docker.io/bitnamicharts/argo-cd:${BITNAMI_ARGOCD_VERSION}" >> ${GAP_DIR}/urls.txt

# Archive the images
# Get list of images from chart
RAW_IMAGE_LIST=$(helm template oci://registry-1.docker.io/bitnamicharts/argo-cd --version ${BITNAMI_ARGOCD_VERSION} | yq -r '..|.image? | select(.)' | sort -u)
echo $RAW_IMAGE_LIST
# Convert list to real array
readarray -t IMAGES<<<"$RAW_IMAGE_LIST"
# Go over array
for IMAGE in ${IMAGES[@]}
do
  SAFE_FILENAME=image-bitnami-$(echo $IMAGE | cut -d "/" -f 3 | tr : _).tgz
  ${GAP_DIR}/temp/crane pull "${IMAGE}" ${GAP_DIR}/argocd/${SAFE_FILENAME}
  echo "${IMAGE}" >> ${GAP_DIR}/urls.txt
done

