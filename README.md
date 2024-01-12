# k3s-airgap-quickstart

## Requirements
## yq
On Rocky 8:
```
sudo yum install -y python3
python3 -m pip install --user yq
```

## Stack
- K3s
  - Flannel (disabled due to nf_tables issues)
- Calico
  - Includes calicoctl
  - Not using operator - makes little sense in airgapped installs
- Helm
- Crane


## Tasks
### Freeze versions to use
```./quickstart.sh freeze```

### Download files for frozen versions
```./quickstart.sh download```

### Install from downloaded files
```./quickstart.sh install```

### Smoketest the installed K3s node
```./smoketest.sh```



## Notes
- If installing manually, K3s pods will be in 'Pending' state until Calico is installed
  - This is because Flannel is disabled, so the node has no CNI - ```kubectl describe node``` should show it as not ready because there is no CNI
- K3s Uninstall only cleans up resources IT installs - see https://github.com/k3s-io/k3s/issues/1469
