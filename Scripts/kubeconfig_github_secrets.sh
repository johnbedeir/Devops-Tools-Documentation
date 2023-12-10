#!/bin/bash

# Define variables
SECRET_NAME="KUBECONFIG"
REPO_OWNER=""
REPO_NAME=""
KUBECONFIG_PATH="$HOME/.kube/config"
KUBECONFIG=$(cat $KUBECONFIG_PATH | base64)


# Add kubeconfig in GitHub secret
echo $KUBECONFIG | gh secret set $SECRET_NAME --repos=$OWNER/$REPO
    if [ $? -eq 0 ]; then
        echo "Secret $SECRET_NAME set successfully."
    else
        echo "Failed to set secret $SECRET_NAME."
        exit 1
    fi
