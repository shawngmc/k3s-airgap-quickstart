#!/bin/bash

/usr/local/bin/k3s-uninstall.sh

# Clean up files
sudo rm -rf /etc/rancher
sudo rm -rf /var/lib/rancher
sudo rm -rf /usr/local/bin/k3s
