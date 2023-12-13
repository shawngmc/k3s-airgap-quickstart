# k3s-airgap-quickstart

## Stack
- K3s
  - Flannel (disabled due to nf_tables issues)
- Calico
  - Includes calicoctl
  - Not using operator - makes little sense in airgapped installs
- Helm
- Crane


## Tasks
### Download files
```./quickstart.sh download```

### Install from downloaded files
```./quickstart.sh install```

### Smoketest the installed K3s node
```./smoketest.sh```



## Notes
- If installing manually, K3s pods will be in 'Pending' state until Calico is installed
  - This is because Flannel is disabled, so the node has no CNI - ```kubectl describe node``` should show it as not ready because there is no CNI
