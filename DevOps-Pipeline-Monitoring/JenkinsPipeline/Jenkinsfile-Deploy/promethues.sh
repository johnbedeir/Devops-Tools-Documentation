#!/bin/bash

# NODE_EXPORTER_CONFIG=/etc/promethues/promethues.yml

# # Get the names of the nodes in the cluster
# NODE_NAMES=$(kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')

# # Generate the Node Exporter configuration file
# echo "scrape_configs:" > $NODE_EXPORTER_CONFIG
# echo "  - job_name: 'node'" >> $NODE_EXPORTER_CONFIG
# echo "    static_configs:" >> $NODE_EXPORTER_CONFIG
# for NODE_NAME in $NODE_NAMES; do
#   echo "      - targets: ['$NODE_NAME:9100']" >> $NODE_EXPORTER_CONFIG
# done

# # Restart the Node Exporter service to pick up the new configuration file
# systemctl restart node_exporter.service

# Define the Kubernetes namespace where the Node Exporters are running
NAMESPACE="default"

# Get the names of the nodes in the cluster
NODE_NAMES=$(kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')

# Loop over the worker nodes and generate the Prometheus configuration file
for NODE_NAME in $NODE_NAMES; do
  # Use kubectl to create the prometheus.yml file in the correct location on the node
  kubectl exec -n $NAMESPACE $NODE_NAME -- sh -c \
    'echo "scrape_configs:" > /etc/prometheus/prometheus.yml && \
     echo "  - job_name: '\''node'\''" >> /etc/prometheus/prometheus.yml && \
     echo "    static_configs:" >> /etc/prometheus/prometheus.yml && \
     echo "      - targets: ['\''$NODE_NAME:9100'\'']" >> /etc/prometheus/prometheus.yml'

  # Restart the Node Exporter service on the node to pick up the new configuration file
  ssh $NODE_NAME "systemctl restart node_exporter.service"
done
