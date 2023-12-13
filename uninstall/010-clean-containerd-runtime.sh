#!/bin/bash

sudo /usr/local/bin/k3s ctr containers del $(sudo /usr/local/bin/k3s ctr containers ls -q)
sudo /usr/local/bin/k3s ctr images del $(sudo /usr/local/bin/k3s ctr images ls -q)
sudo /usr/local/bin/k3s ctr content del $(sudo /usr/local/bin/k3s ctr content ls -q)
sudo /usr/local/bin/k3s ctr leases del $(sudo /usr/local/bin/k3s ctr leases ls -q)
sudo /usr/local/bin/k3s ctr namespaces rm $(sudo /usr/local/bin/k3s ctr namespaces ls -q)
