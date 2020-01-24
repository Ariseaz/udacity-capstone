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
    stages('docker build/push') {
        node {
          def commit_id
          stage('Preparation') {
            checkout scm
            sh "git rev-parse --short HEAD > .git/commit-id"                        
            commit_id = readFile('.git/commit-id').trim()
          }
          stage('test') {
            nodejs(nodeJSInstallationName: 'nodejs') {
              sh 'npm install --only=dev'
              sh 'npm test'
            }
          }
          stage('docker build/push') {
            docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
              def app = docker.build("adenijiazeez/docker-nodejs-demo:${commit_id}", '.').push()
            }
          }
        }

   }
    stage('Deploy Kubernetes') {
      steps {
        sh 'kubectl apply -f ./kubernetes'
      }
    }
  }
}