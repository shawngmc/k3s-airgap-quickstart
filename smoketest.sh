#!/bin/bash

echo "Creating NGINX deployment..."
kubectl create deployment nginx --image=nginx
sleep 10

echo "Exposing NodePort..."
kubectl expose deployment nginx --port 80 --type NodePort
sleep 5

NODE_PORT=$(kubectl get svc nginx \
	  --output=jsonpath='{range .spec.ports[0]}{.nodePort}')
echo "Testing nginx deployment at http://127.0.0.1/${NODE_PORT}..."
curl -I http://127.0.0.1:${NODE_PORT}

echo "Cleaning up NGINX deployment and service..."
kubectl delete svc nginx
kubectl delete deployment nginx
