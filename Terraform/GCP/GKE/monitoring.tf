variable "kube_monitoring_stack_values" {
  type    = string
  default = <<-EOF
    grafana:
      adminUser: admin
      adminPassword: admin
      enabled: true
      service:
        type: LoadBalancer
      ingress:
        enabled: false
      resources:
        requests:
          cpu: "100m"
          memory: "100Mi"
        limits:
          cpu: "200m"
          memory: "200Mi"

    alertmanager:
      enabled: true
      service:
        type: LoadBalancer
      ingress:
        enabled: false
      resources:
        requests:
          cpu: "100m"
          memory: "100Mi"
        limits:
          cpu: "200m"
          memory: "200Mi"

    prometheus:
      ingress:
        enabled: false
      service:
        type: LoadBalancer
      prometheusSpec:
        replicas: 2
        replicaExternalLabelName: prometheus_replica
        prometheusExternalLabelName: prometheus_cluster
        enableAdminAPI: false
        logFormat: logfmt
        logLevel: info
        retention: 120h
        serviceMonitorSelectorNilUsesHelmValues: false
        serviceMonitorNamespaceSelector: {}
        serviceMonitorSelector: {}
      resources:
        requests:
          cpu: "100m"
          memory: "100Mi"
        limits:
          cpu: "200m"
          memory: "200Mi"

    prometheus-node-exporter:
      resources:
        requests:
          cpu: "80m"
          memory: "100Mi"
        limits:
          cpu: "160m"
          memory: "200Mi"

    kube-state-metrics:
      resources:
        requests:
          cpu: "100m"
          memory: "100Mi"
        limits:
          cpu: "200m"
          memory: "200Mi"

    prometheusOperator:
      resources:
        requests:
          cpu: "100m"
          memory: "100Mi"
        limits:
          cpu: "200m"
          memory: "200Mi"
    EOF
}

resource "helm_release" "kube_monitoring_stack" {
  name             = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  version          = "45.29.0"
  create_namespace = true
  values           = [var.kube_monitoring_stack_values]
}
