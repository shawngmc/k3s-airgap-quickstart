#!/bin/bash

source .env

# Download K3s
wget https://github.com/k3s-io/k3s/releases/download/${K3S_VERSION}/k3s -O $TEMP_DIR/k3s
wget https://github.com/k3s-io/k3s/releases/download/${K3S_VERSION}/k3s-airgap-images-amd64.tar -O $TEMP_DIR/k3s-airgap-images-amd64.tar
wget https://get.k3s.io/ -O $TEMP_DIR/install.sh
# Stage images
sudo mkdir -p /var/lib/rancher/k3s/agent/images/
sudo cp ${TEMP_DIR}/k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/
sudo chmod 755 /var/lib/rancher
sudo chmod 755 /var/lib/rancher/k3s
sudo chmod 755 /var/lib/rancher/k3s/agent
sudo chmod 755 /var/lib/rancher/k3s/agent/images
sudo chmod 644 /var/lib/rancher/k3s/agent/images/k3s-airgap-images-amd64.tar

# Stage executable
sudo cp ${TEMP_DIR}/k3s /usr/local/bin/k3s
sudo chmod 755 /usr/local/bin/k3s
k3s --version
# Create config
sudo mkdir -pv /etc/rancher/k3s
sudo tee "/etc/rancher/k3s/config.yaml" > /dev/null <<'EOF'
write-kubeconfig-mode: "0644"
disable-network-policy: true
flannel-backend: none
EOF
sudo chmod 644 /etc/rancher/k3s/config.yaml
# Install k3s airgap
chmod 744 ${TEMP_DIR}/install.sh
INSTALL_K3S_SKIP_DOWNLOAD=true ${TEMP_DIR}/install.sh
