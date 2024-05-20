# GKE and Monitoring Setup with Prometheus, Alertmanager, and Grafana

This project automates the setup of a Google Kubernetes Engine (GKE) cluster with monitoring capabilities using Prometheus, Alertmanager, and Grafana. The infrastructure and services are provisioned using Terraform using Helm.

## Prerequisites

- [Installed Google Cloud CLI](https://cloud.google.com/sdk/docs/install) (gcloud)
- [Installed Terraform](https://developer.hashicorp.com/terraform/install)
- [Installed Helm](https://helm.sh/docs/intro/install/)

## Setup Instructions

### 1. Update GCloud CLI

For Linux Users Ensure your Google Cloud CLI is up to date by running:

```bash
sudo apt-get update && \
sudo apt-get --only-upgrade install \
google-cloud-cli-app-engine-go \
google-cloud-cli-spanner-migration-tool \
google-cloud-cli-terraform-tools \
google-cloud-cli-cbt \
google-cloud-cli-kpt \
google-cloud-cli-anthos-auth \
google-cloud-cli-istioctl \
google-cloud-cli-package-go-module \
google-cloud-cli-enterprise-certificate-proxy \
google-cloud-cli-minikube \
google-cloud-cli-gke-gcloud-auth-plugin \
google-cloud-cli-app-engine-python \
google-cloud-cli-cloud-run-proxy \
google-cloud-cli-pubsub-emulator \
google-cloud-cli-app-engine-grpc \
google-cloud-cli-nomos \
google-cloud-cli-bigtable-emulator \
google-cloud-cli-spanner-emulator \
google-cloud-cli-datastore-emulator \
google-cloud-cli-local-extract \
google-cloud-cli-firestore-emulator \
google-cloud-cli-skaffold kubectl \
google-cloud-cli-log-streaming \
google-cloud-cli-app-engine-python-extras \
google-cloud-cli \
google-cloud-cli-harbourbridge \
google-cloud-cli-config-connector \
google-cloud-cli-docker-credential-gcr \
google-cloud-cli-cloud-build-local \
google-cloud-cli-kubectl-oidc \
google-cloud-cli-app-engine-java
```

### 2. Update Helm Repositories

Update your Helm repositories to ensure you have the latest charts:

```bash
helm repo update
```

### 3. Authenticate with GCP

Login to your GCP account:

```bash
gcloud auth login
```

### 4. Download GCP Credentials

Nvigate to your GCP Service Accounts and find the `SERVICE_ACCOUNT_EMAIL` create one if you don't already have.

```bash
gcloud iam service-accounts keys create FILE_NAME.json --iam-account SERVICE_ACCOUNT_EMAIL
```

### 5. Configure Terraform Variables

Set the required Terraform variables by updating the variables in `variables.tf` with `YOUR_PROJECT_ID`, `REGION`, `CLUSTER_NAME`, and `ENV_NAME`:

```
variable "project_id" {
  description = "The name of the VPC to use."
  type        = string
  default     = "YOUR_PROJECT_ID"
}

variable "region" {
  description = "The name of the VPC to use."
  type        = string
  default     = "REGION"
}

variable "name_prefix" {
  description = "The name of the VPC to use."
  type        = string
  default     = "CLUSTER_NAME"
}

variable "environment" {
  type    = string
  default = "ENV_NAME"
}
```

### 6. Apply Terraform Configuration

Initialize Terraform and apply the configuration to create the resources:

```bash
terraform init
terraform apply -auto-approve
```

### 7. Access the Kubernetes Cluster

Retrieve credentials for your newly created GKE cluster:

```bash
gcloud container clusters get-credentials [CLUSTER_NAME-ENV_NAME] --region [REGION] --project [PROJECT_ID]
```

## Monitoring Components

Once the setup is complete, Prometheus, Alertmanager, and Grafana will be installed on your GKE cluster with `LoadBalancer`, to access them run the following commands to get the URL for each one:

### Alertmanager:

```
kubectl get svc <service-name> -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

### Prometheus:

```
kubectl get svc <service-name> -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

### Grafana:

```
kubectl get svc <service-name> -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

## Cleaning Up

```bash
terraform destroy -auto-approve
```
