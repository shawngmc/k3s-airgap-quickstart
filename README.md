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
