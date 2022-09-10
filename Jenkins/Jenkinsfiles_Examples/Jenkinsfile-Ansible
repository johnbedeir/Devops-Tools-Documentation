// This Jenkinsfile is to login with Docker Credentials and run ansible playbook file that will run docker commands to build image, run container and push image to dockerhub  

//Pipeline start here
pipeline {
    agent any

//Add Dockerhub Credentials
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
  //Pipeline stages
    stages {
      // First Stage
        stage('First-Stage') {
          // Steps in first stage
            steps {
              // Command to login using dockerhub credentials  
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Second-Stage') {
            steps {
              // Run mutliple commands
              sh """
              cd ${APPLICATION_DIR}
              ansible-playbook playbook.yml
              """
            }
        }
    }
}
