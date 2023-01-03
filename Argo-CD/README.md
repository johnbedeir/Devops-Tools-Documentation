# Deploy App using ArgoCD

<img src="argo.png"  width="255" height="250">

## In those stpes we will deploy application with kubernetes manifest files on minikube using argo-cd

### Step 1: Deploy ArgoCD
[Official Documentation](https://argo-cd.readthedocs.io/en/stable/)
```
kubectl create ns argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
### Step 2: Change Port Type

1. Open K9s
2. Open Services
3. Hover on argocd-server tap 'e'
4. Change `type: ClusterIP` to be `type: NodePort`

### Step 3: Get ArgoCD URL
```
minikube service -n argocd argocd-server --url
```
`Open one of the links on the browser`

### Step 4: Get ArgoCD Password

`Username: admin`

`Password:`
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### Step 5: Add Application Repository

1. Navigate to `Settings` > `Repositories`
2. `Connect Repo` > `VIA HTTPS`
3. Fill in the required detials

    Type `git`

    Project `default`

    `Repository URL`

  `NOTE: If your repositoy is private you can add your git credentials`

4. Navigate to `Applications`

5. Tap on `New App`

6. Fill in the required details:

    Application Name

    Project Name `default`

    Sync Policy `Automatic`

    Source `Choose the repository you have added`

    Path `The path to the kubernetes manifest files`

    Cluster URL `https://kubernetes.default.svc`

    Namespace `If the namespace is not exist then create it first`

    Tap on `Create`
