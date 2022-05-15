pipeline {
    agent any

    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        stage('Docker Login') {
            steps {
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Build & push Dockerfile') {
            steps {
              sh """
              cd Kubernetes/comingsoon/
              ansible-playbook playbook.yml
              """
            }
        }
        stage('Delete Cluster') {
            steps {
              // You will need to install CloudBees AWS Credentials Plugin in Jenkins and add AWS Credentials first 
                withCredentials([[
                  $class: 'AmazonWebServicesCredentialsBinding',
                  credentialsId: "aws-credentials",
                  accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                  secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                  ]]) {
                  sh "eksctl delete cluster --name comingsoon-cluster --region eu-central-1"
                  sleep(time: 180, unit: "SECONDS")
                }
            }
        }
        stage('Create Cluster') {
            steps {
              // You will need to install CloudBees AWS Credentials Plugin in Jenkins and add AWS Credentials first 
                withCredentials([[
                  $class: 'AmazonWebServicesCredentialsBinding',
                  credentialsId: "aws-credentials",
                  accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                  secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                  ]]) {
                  sh """
                  eksctl create cluster --name comingsoon-cluster --region eu-central-1 --nodes-min=2
                  aws eks update-kubeconfig --name comingsoon-cluster
                  """
                }
            }
        }
        stage('Create Namespace') {
            steps {
              // You will need to install CloudBees AWS Credentials Plugin in Jenkins and add AWS Credentials first 
                withCredentials([[
                  $class: 'AmazonWebServicesCredentialsBinding',
                  credentialsId: "aws-credentials",
                  accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                  secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                  ]]) {
                  sh "kubectl create namespace comingsoon"
                }
            }
        }
        stage('Deploy') {
            steps {
              // You will need to install CloudBees AWS Credentials Plugin in Jenkins and add AWS Credentials first 
                withCredentials([[
                  $class: 'AmazonWebServicesCredentialsBinding',
                  credentialsId: "aws-credentials",
                  accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                  secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                  ]]) {
                  sh """
                  cd Kubernetes/comingsoon/k8s
                  kubectl -n comingsoon apply -f deployment.yaml
                  kubectl -n comingsoon apply -f services.yaml
                  """
                }
            }
        }
    }
}


