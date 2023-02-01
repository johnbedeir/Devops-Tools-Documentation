# Deploy ArgoCD using Helm 

<img src="argo.png"  width="255" height="250"> <img src="helm.png"  width="255" height="250">

[Official Documentation](https://artifacthub.io/packages/helm/argo/argo-cd)
## Add ArgoCD Helm Repo 
```
helm repo add argo https://argoproj.github.io/argo-helm
```

## Update Helm Repo
```
helm repo update
```

## Deploy ArgoCD 

```
helm install argo argo/argo-cd
```

## Get ArgoCD service name
```
kubectl get service
```

## Expose ArgoCD service to port 8080
```
kubectl port-forward service/argo-argocd-server -n default 8080:443
```

## Deploy using your desired configuration

`Create a YAML file named` **values.yaml** `with the desired configuration for your Argo CD deployment`

```
helm install argo argo/argo-cd -f values.yaml
```

## Uninstall Chart
```
helm uninstall argo argo/argo-cd
```


