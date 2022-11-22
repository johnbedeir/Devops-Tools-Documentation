# Github Actions Workflow to build and push docker image to AWS ECR

## Step 1: 
Create AWS ECR Repository 

`NOTE: make sure to update the variable `**ECR_REPOSITORY: nginx-docker** [aws.yaml](https://github.com/johnbedeir/Github_Actions_Docker_ECR/blob/main/.github/workflows/aws.yaml#:~:text=ECR_REPOSITORY%3A-,nginx%2Ddocker,-IMAGE_TAG%3A%20nginx) ` with the repository name`

## Step 2: 
Create github repository and create two Github Secrets using the following names and add your **IAM Access Key and Secret Accress Key**
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

## Step 3: 
Commit the following files you found in this repository

1. Dockerfile 
2. .github/workflows.aws.yaml







