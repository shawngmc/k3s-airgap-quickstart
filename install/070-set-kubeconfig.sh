#!/bin/bash
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
while true; do

read -p "Do you want to set KUBECONFIG in your .bashrc? This will overwrite any existing value! (y/n) " yn

case $yn in 
	[yY] ) echo Writing .bashrc;
		sed -i '/KUBECONFIG=/d' ~/.bashrc
		echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
		break;;
	[nN] ) echo Skipping .bashrc...;
		exit;;
	* ) echo invalid response;;
esac

done

