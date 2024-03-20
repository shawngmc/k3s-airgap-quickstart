#!/bin/bash

# Delete cluster
kind delete cluster --all

# Clean up files
sudo rm -rf /usr/local/bin/kind
