pipeline {
     agent any
     stages {
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }

         stage('Upload to AWS') {
             steps {
                  withAWS(region:'us-east-1',credentials:'aws-static') {
                  sh 'echo "Uploading content to AWS S3 Bucket"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'azudacitystatic')
                  }
             }
         }
     }
}
