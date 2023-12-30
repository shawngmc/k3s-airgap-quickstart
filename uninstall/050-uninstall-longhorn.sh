#!/bin/bash

helm uninstall longhorn --namespace longhorn-system

# Remove validators
kubectl delete mutatingwebhookconfigurations longhorn-webhook-mutator
kubectl delete validatingwebhookconfigurations longhorn-webhook-validator

# Remove engineimage by clearing finalizer
kubectl get engineimage.longhorn.io -n longhorn-system -o name | xargs -n 1 kubectl patch -n longhorn-system -p '{"metadata":{"finalizers":null}}'

kubectl delete namespace longhorn-system
