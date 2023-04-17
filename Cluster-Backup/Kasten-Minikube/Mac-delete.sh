#!/bin/bash

export NAMESPACE=kasten-io


#Delete all resources in the namespace
echo "--------------------Delete All Resources--------------------"
kubectl delete namespace NAMESPACE --wait=false

#Delete namespace
echo "--------------------Delete Namespace--------------------"
kubectl delete namespace $NAMESPACE --force --grace-period=0



