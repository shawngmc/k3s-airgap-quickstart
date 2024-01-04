#!/bin/bash

source ${GAP_DIR}/.env

echo "Staging Crane executable..."
sudo tar -zxvf ${GAP_DIR}/go-containerregistry.tar.gz -C /usr/local/bin/ crane
sudo chmod 755 /usr/local/bin/crane
