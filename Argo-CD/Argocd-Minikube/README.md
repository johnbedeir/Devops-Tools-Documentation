# Deploy using ArgoCD on Minikube

<img src="argo.png"  width="255" height="250"> <img src="minikube.png"  width="230" height="230">

## In those stpes we will deploy application with kubernetes manifest files on minikube using argo-cd

### Step 1: Deploy ArgoCD

[Official Documentation](https://argo-cd.readthedocs.io/en/stable/)

Running this script will do the following:

1. Start Minikube
2. Create argocd namespace
3. Deploy argocd on the created namespace
4. Wait for the pods to start
5. Change argocd service from ClusterIP to NodePort
6. Get Argocd URL
7. Get Argocd default password

```
chmod +x deploy-argocd-minikube

./deploy-argocd-minikube
```

### Delete ArgoCD deployment

Running this script will do the following:

1. Delete argocd deployment
2. Delete argocd namespace

```
chmod +x remove-argocd-minikube.sh
./remove-argocd-minikube.sh
```

### Step 2: Add Application Git Repository

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

   Source `Choose the repository you have added`

   Path `The path to the kubernetes manifest files`

   Cluster URL `https://kubernetes.default.svc`

   Namespace `If the namespace is not exist then create it first`

   Tap on `Create`
