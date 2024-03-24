```sudo apt-get update && \
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

```
helm repo update
```

```
gcloud container clusters get-credentials my-gke-cluster --region europe-west1-c --project johnydev
```

`NOTE: 2 nodes or revert monitoring stack values > resource, limit and requests`
