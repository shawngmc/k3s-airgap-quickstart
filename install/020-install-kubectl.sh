#!/bin/bash

source ${GAP_DIR}/.env

echo "Staging Crane executable..."
sudo install ${GAP_DIR}/kubectl /usr/local/bin/
