pipeline {
   agent any
   stages {
     stage('Terraform Plan') {
       steps {
          sh 'sudo terraform init'
          sh 'sudo terraform plan'
       }
     }
     stage('Terraform Apply') {
       steps {
         input 'Does the terraform execution plan look good to be applied?'
         milestone(1)
         sh 'sudo terraform apply -target docker_image.httpd-image-resource  -target docker_container.httpd-container-resource'
         sh 'sudo chown -R jenkins:jenkins * && sudo chown -R jenkins:jenkins .terraform'
       }
     }
   }
}
