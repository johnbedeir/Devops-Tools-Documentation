# Deploy Promethues using Helm 

## Add Prometheus Helm Repo 
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

## Update Helm Repo
```
helm repo update
```

## Deploy Promethues 

```
helm install [RELEASE_NAME] prometheus-community/prometheus
```

## Expose Prometheus service to port 9090
```
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np
```

## Uninstall Chart
```
helm uninstall [RELEASE_NAME]
```