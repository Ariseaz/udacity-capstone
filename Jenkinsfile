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

   stage ("lint dockerfilessss") {
        echo 'Linting...'
      sh 'dockerlint Dockerfile'
  }


    stage ("lint dockerfile") {
    agent {
        docker {
            image 'hadolint/hadolint'
        }
    }
    steps {
        sh 'docker run -i hadolint/hadolint < Dockerfile'
    }
  }

   stage('docker build/push') {
     docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
       def app = docker.build("adenijiazeez/docker-nodejs-demo:${commit_id}", '.').push()
     }
   }
}
