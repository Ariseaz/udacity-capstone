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
    stage('docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("adenijiazeez/docker-nodejs-demo:${commit_id}", '.').push()
     }
   }
    stage('Deploy Kubernetes') {
      steps {
        sh 'kubectl apply -f ./kubernetes'
      }
    }
  }
}