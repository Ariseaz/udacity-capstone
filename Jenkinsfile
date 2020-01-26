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

    stage('Lint Dockerfile') {
      steps {
          sh 'hadolint <Dockerfile>
              hadolint --ignore DL3003 --ignore DL3006 <Dockerfile> # exclude specific rules
              hadolint --trusted-registry my-company.com:500 <Dockerfile> # Warn when using untrusted FROM images'
      }
    }

   stage('docker build/push') {
     docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
       def app = docker.build("adenijiazeez/docker-nodejs-demo:${commit_id}", '.').push()
     }
   }
}
