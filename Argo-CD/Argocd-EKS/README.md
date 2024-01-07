# Deploy ArgoCD using Helm Chart

<img src="argo.png"  width="255" height="250"> <img src="helm.png"  width="255" height="250">

🎥 For a detailed walkthrough into this project, check out my video on YouTube: [HERE](https://youtu.be/UHcbz5h-1Ws).

### Deploy Argo-CD with Helm on AWS EKS:

### Step 1: Deploy ArgoCD

[Official Documentation](https://argo-cd.readthedocs.io/en/stable/)

Running this script will do the following:

1. Create AWS EKS
2. Create argocd namespace
3. Deploy argocd on the created namespace
4. Wait for the pods to start
5. Change argocd service from ClusterIP to LoadBalancer
6. Get Argocd URL
7. Get Argocd default password

```
chmod +x deploy-argocd-eks.sh

./deploy-argocd-eks.sh
```

### Delete ArgoCD deployment

Running this script will do the following:

1. Delete argocd deployment
2. Delete argocd namespace
3. Delete Cluster

```
chmod +x remove-argocd-eks.sh

./remove-argocd-eks.sh
```

### Step 2: Add Application Helm Repository

1. Navigate to `Settings` > `Repositories`
2. `Connect Repo` > `VIA HTTPS`
3. Fill in the required detials

   Type `helm`

   Project `default`

   `Helm Repository URL`

4. Navigate to `Applications`

5. Tap on `New App`

6. Fill in the required details:

   Application Name

   Project Name `default`

   Source `Choose the helm repository url you have added`

   Chart `URL` and `Version`

   Cluster URL `https://kubernetes.default.svc`

   Namespace `If the namespace is not exist then you will need to create it`

   `NOTE: If you need` **External IP** `for your application then you can change the values of the helm chart in the same page, search for` **service.type** `and change it's value to` **LoadBalancer**

   Tap on `Create`
