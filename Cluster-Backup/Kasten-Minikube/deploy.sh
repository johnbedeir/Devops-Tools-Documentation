#!/bin/bash

NAMESPACE=kasten-io

#Create namespace
echo "--------------------Create Namespace--------------------"
kubectl create namespace $NAMESPACE || true

#Add Helm Repo
echo "--------------------Add Kasten Helm Repo--------------------"
helm repo add kasten https://charts.kasten.io/

#Update Helm Repositoies
echo "--------------------Update Helm Repo--------------------"
helm repo update

#Install kasten with helm and port forward
echo "--------------------Install Kasten--------------------"
helm install k10 kasten/k10 -n $NAMESPACE || true

#Wait for the pod to start
echo "--------------------Wait 1m Pod is Starting--------------------"
sleep 1m

#Update helm repo
echo "--------------------Update Helm Repo & Upgrade K10--------------------"
helm repo update && \
helm upgrade k10 kasten/k10 -n $NAMESPACE || true

#Port forward
echo "--------------------Port Forward--------------------"
kubectl -n $NAMESPACE port-forward service/gateway 8080:8000 &

#open kasten on brwoser
xdg-open http://127.0.0.1:8080/k10/
