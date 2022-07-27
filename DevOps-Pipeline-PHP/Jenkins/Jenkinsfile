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
                cd DevOps-Pipeline-PHP/laravel-app
                ansible-playbook playbook.yml
                """
            }
        }
        stage('Run Dockercompose playbook') {
            steps {
                sh """
                cd DevOps-Pipeline-PHP/laravel-app
                ansible-playbook playbook-dcompose.yml 
                """
            }
        }
    }
}
