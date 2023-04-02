#!/bin/bash

# Variables

PROMETHEUS_RELEASENAME="prometheus"
GRAFANA_RELEASENAME="grafana"
NAMESPACE="monitoring"
PROMETHEUS_SVC="prometheus-server"
GRAFANA_SVC="grafana"
# Variables

# Add repos
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts

# Update repos
helm repo update

# Create namespace
kubectl create ns $NAMESPACE || true

# Deploy Prometheus and Grafana
helm install $PROMETHEUS_RELEASENAME prometheus-community/prometheus --namespace $NAMESPACE --values="$PWD/Prometheus/values-prometheus.yaml"
helm install $GRAFANA_RELEASENAME grafana/grafana --namespace $NAMESPACE --values="$PWD/Grafana/values-grafana.yaml"

# Wait for the pods to start
sleep 60s

PROMETHEUS_URL=$(minikube service -n monitoring $PROMETHEUS_SVC --url)
GRAFANA_URL=$(minikube service -n monitoring $GRAFANA_SVC --url)

# Reveal Prometheus and Grafana URL
echo "Prometheus URL: $PROMETHEUS_URL"
echo "Grafana URL: $GRAFANA_URL"

# Open URL on browser
xdg-open $PROMETHEUS_URL
xdg-open $GRAFANA_URL
