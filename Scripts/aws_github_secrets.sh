#!/bin/bash

# Set your GitHub repo details
OWNER=""
REPO=""

# Set AWS credentials - ideally, these would be read from a secure source or environment variables
AWS_ACCESS_KEY_ID=$(awk -F "=" '/aws_access_key_id/ {print $2}' ~/.aws/credentials | xargs)
AWS_SECRET_ACCESS_KEY=$(awk -F "=" '/aws_secret_access_key/ {print $2}' ~/.aws/credentials | xargs)

# Function to create or update GitHub secret
create_secret() {
    local secret_name="$1"
    local secret_value="$2"

    # Create or update the secret in the GitHub repository using the 'gh' CLI tool
    echo "Setting secret $secret_name..."
    echo $secret_value | gh secret set $secret_name --repos=$OWNER/$REPO
    if [ $? -eq 0 ]; then
        echo "Secret $secret_name set successfully."
    else
        echo "Failed to set secret $secret_name."
        exit 1
    fi
}

# Call the function with each AWS credential
create_secret "AWS_ACCESS_KEY_ID" "$AWS_ACCESS_KEY_ID"
create_secret "AWS_SECRET_ACCESS_KEY" "$AWS_SECRET_ACCESS_KEY"

# Print success message
echo "AWS credentials stored as GitHub secrets in the repository $OWNER/$REPO"
