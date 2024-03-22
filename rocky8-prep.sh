#!/bin/bash

# Per https://www.crunchydata.com/blog/kube-cluster-from-scratch-on-rocky-8

# Enable CGroups v2
sudo dnf install -y grubby && \
  sudo grubby \
  --update-kernel=ALL \
  --args="systemd.unified_cgroup_hierarchy=1"

# Enable cgroup controllers
OUTFILE=/etc/systemd/system.conf
sudo out=$OUTFILE bash -c 'cat << EOF >> $out
DefaultCPUAccounting=yes
DefaultIOAccounting=yes
DefaultIPAccounting=yes
DefaultBlockIOAccounting=yes
EOF'
