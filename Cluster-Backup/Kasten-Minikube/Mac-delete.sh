#!/bin/bash

export NAMESPACE=kasten-io

#Delete helm repository
echo "--------------------Delete Helm Repo--------------------"
helm repo remove kasten

#Delete all resources in the namespace
echo "--------------------Delete All Resources--------------------"
kubectl delete namespace $NAMESPACE --force --grace-period=0
