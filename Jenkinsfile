pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'make lint'
      }
    }
    stage('Build Docker') {
      steps {
        sh 'make build'
      }
    }
    
    stage('Login to dockerhub') {
      docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
        sh 'docker login'
      }
    }


    stage('Deploy Kubernetes') {
      steps {
        sh 'kubectl apply -f ./kubernetes'
      }
    }
  }
}