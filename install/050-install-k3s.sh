#!/bin/bash

source ${GAP_DIR}/.env

echo "Staging k3s images..."
sudo mkdir -p /var/lib/rancher/k3s/agent/images/
sudo cp ${GAP_DIR}/k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/
sudo chmod 755 /var/lib/rancher
sudo chmod 755 /var/lib/rancher/k3s
sudo chmod 755 /var/lib/rancher/k3s/agent
sudo chmod 755 /var/lib/rancher/k3s/agent/images
sudo chmod 644 /var/lib/rancher/k3s/agent/images/k3s-airgap-images-amd64.tar

echo "Staging k3s executable..."
sudo cp ${GAP_DIR}/k3s /usr/local/bin/k3s
sudo chmod 755 /usr/local/bin/k3s
k3s --version

#if EL7/8/9, install the SELinux RPM
KERNEL_REL=$(uname -r)
if [[ "$KERNEL_REL" == *".el7"* ]]; then
  echo "Detected RHEL7 derivative..."
  EL_VERSION=7
elif [[ "$KERNEL_REL" == *".el8"* ]]; then
  echo "Detected RHEL8 derivative..."
  EL_VERSION=8
elif [[ "$KERNEL_REL" == *".el9"* ]]; then
  echo "Detected RHEL9 derivative..."
  EL_VERSION=9
fi
if [ -n $EL_VERSION ]; then
  echo "Installing SELinux Shim..."
  sudo yum localinstall -y ${GAP_DIR}/k3s-selinux-${K3S_SELINUX_VERSION}.el${EL_VERSION}.noarch.rpm
fi

echo "Creating k3s config..."
sudo mkdir -pv /etc/rancher/k3s
sudo tee "/etc/rancher/k3s/config.yaml" > /dev/null <<'EOF'
write-kubeconfig-mode: "0644"
disable-network-policy: true
flannel-backend: none
cluster-cidr: 192.168.0.0/16
EOF
sudo chmod 644 /etc/rancher/k3s/config.yaml

echo "Installing k3s airgap..."
chmod 744 ${GAP_DIR}/k3s_install.sh
INSTALL_K3S_SKIP_DOWNLOAD=true ${GAP_DIR}/k3s_install.sh
