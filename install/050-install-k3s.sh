#!/bin/bash

source .env

# Stage images
sudo mkdir -p /var/lib/rancher/k3s/agent/images/
sudo cp ${GAP_DIR}/k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/
sudo chmod 755 /var/lib/rancher
sudo chmod 755 /var/lib/rancher/k3s
sudo chmod 755 /var/lib/rancher/k3s/agent
sudo chmod 755 /var/lib/rancher/k3s/agent/images
sudo chmod 644 /var/lib/rancher/k3s/agent/images/k3s-airgap-images-amd64.tar

# Stage k3s executable
sudo cp ${GAP_DIR}/k3s /usr/local/bin/k3s
sudo chmod 755 /usr/local/bin/k3s
k3s --version

# Create config
sudo mkdir -pv /etc/rancher/k3s
sudo tee "/etc/rancher/k3s/config.yaml" > /dev/null <<'EOF'
write-kubeconfig-mode: "0644"
disable-network-policy: true
flannel-backend: none
EOF
sudo chmod 644 /etc/rancher/k3s/config.yaml

# Install k3s airgap
chmod 744 ${GAP_DIR}/k3s_install.sh
INSTALL_K3S_SKIP_DOWNLOAD=true ${GAP_DIR}/k3s_install.sh
