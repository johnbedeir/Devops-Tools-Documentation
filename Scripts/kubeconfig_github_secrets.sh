#!/bin/bash

# Define variables
SECRET_NAME=""
REPO_OWNER=""
REPO_NAME=""
KUBECONFIG_PATH=""

# Check if kubeconfig file exists
if [ ! -f "$KUBECONFIG_PATH" ]; then
    echo "Error: kubeconfig file not found at $KUBECONFIG_PATH"
    exit 1
fi

# Encode kubeconfig in base64
ENCODED_KUBECONFIG=$(cat "$KUBECONFIG_PATH" | base64)

echo "$ENCODED_KUBECONFIG"

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "Error: gh command not found. Please install GitHub CLI."
    exit 1
fi

# Authenticate with GitHub (ensure you are already logged in)
# You may need to run `gh auth login` if you haven’t authenticated before

# Create or update GitHub secret
gh secret set "$SECRET_NAME" --repo="$REPO_OWNER/$REPO_NAME" --body="$ENCODED_KUBECONFIG"

# Check the exit status of the last command and output appropriate message
if [ $? -eq 0 ]; then
    echo "Secret $SECRET_NAME successfully created or updated in $REPO_OWNER/$REPO_NAME"
else
    echo "Failed to create or update secret $SECRET_NAME in $REPO_OWNER/$REPO_NAME"
fi
