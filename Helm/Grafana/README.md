# Deploy Grafana using Helm 

## Add Grafana Helm Repo 
```
helm repo add grafana https://grafana.github.io/helm-charts
```

## Update Helm Repo
```
helm repo update
```

## Deploy Grafana 

```
helm install [RELEASE_NAME]  grafana/grafana
```

## Get Grafana service name
```
kubectl get service
```

## Expose Grafana service to port 3000
```
kubectl --namespace default port-forward [SERVICE_NAME] 3000
```

## Uninstall Chart
```
helm uninstall [RELEASE_NAME]
```


