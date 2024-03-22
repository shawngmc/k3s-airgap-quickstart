# k3s-airgap-quickstart

## Requirements
### Path modification
/usr/local/bin must be on the PATH.

```
echo "export PATH=\"/usr/local/bin:$PATH\"" >> ~/.bashrc
source ~/.bashrc
```

### yq
On Rocky 8:
```
sudo yum install -y python3 python3-pip
python3 -m pip install --user yq
```

## Stack
- Kind
- Helm
- Crane
- Kubectl
- K9s

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
