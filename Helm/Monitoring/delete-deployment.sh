#!/bin/bash

# Variables

PROMETHEUS_RELEASENAME="prometheus"
GRAFANA_RELEASENAME="grafana"
NAMESPACE="monitoring"
# Variables

# Uninstall Proemtheus and Grafana
helm uninstall $PROMETHEUS_RELEASENAME --namespace $NAMESPACE
helm uninstall $GRAFANA_RELEASENAME --namespace $NAMESPACE

# Delete Namespace
kubectl delete ns $NAMESPACE
