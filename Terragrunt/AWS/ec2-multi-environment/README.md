# Terragrunt EC2 Deployment

<img src=terragrunt.png>

## Overview

This project demonstrates the use of Terragrunt to deploy EC2 instances across three different environments: development (`dev-ec2`), pre-production (`pre-prod-ec2`), and production (`prod-ec2`). It utilizes a modular approach with a common configuration for easy management and deployment.

## Prerequisites

- [Terraform installed](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Terragrunt installed](https://terragrunt.gruntwork.io/docs/getting-started/install/)

## Structure

- `root`: The root directory contains the Terragrunt configuration files that are common across all environments.
- `modules/ec2`: The Terraform module for creating EC2 instances.
- `dev`, `pre-prod`, `prod`: Directories containing environment-specific configurations.

### Common Configuration

The `common.tfvars` file contains configurations that are shared across all environments that you don't want to be public on the version control.

### Environment-Specific Configuration

Each environment directory contains specific configurations, such as the name of the EC2 instance.

## Usage

To deploy EC2 instances in all environments, at once:

1. **Navigate to the Root Directory**:

2. **Initialize Terragrunt**:
   Run `terragrunt init` to initialize the working directory.

3. **Plan Deployment**:
   Run `terragrunt plan` to see the changes that will be applied.

4. **Apply Configuration**:
   Run `terragrunt apply` to apply the changes and deploy the EC2 instance.
