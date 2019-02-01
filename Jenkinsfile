pipeline {
   agent any
   parameters {
      choice(
        choices: ['docker_image.httpd-image-resource' , 'docker_container.httpd-container-resource'],
        description: 'You may choose the specific target you want to perform terraform apply or terraform destroy against.',
        name: 'TERRAFORM_RESOURCE')
     }
   stages {
     stage('Terraform Plan') {
       steps {
          sh 'sudo terraform init'
          sh 'sudo terraform plan'
       }
     }
     stage('Choose Resource') {
       steps {
        script {
          if ("${params.TERRAFORM_RESOURCE == 'docker_image.httpd-image-resource'}") {
            echo "Option selected is Image download"
          } else if ("${params.TERRAFORM_RESOURCE == 'docker_image.httpd-image-resource'}") {
            echo "Option selected is Container bootup"
          }
        }
       }
     }
     stage('Terraform - Apply httpd docker resources') {
       steps {
         input 'Does the terraform execution plan look good to be applied?'
         milestone(1)
         sh 'sudo terraform apply -target docker_image.httpd-image-resource -auto-approve'
         sh 'sudo terraform apply -target docker_container.httpd-container-resource -auto-approve'
         sh 'sudo chown -R jenkins:jenkins * && sudo chown -R jenkins:jenkins .terraform'
       }
     }
     stage('Terraform - Destroy httpd docker resources') {
       steps {
         input 'Are you sure you want to destroy the terraform resources?'
         milestone(2)
         sh 'sudo terraform destroy -target docker_container.httpd-container-resource -auto-approve'
         sh 'sudo terraform destroy -target docker_image.httpd-image-resource -auto-approve'
         sh 'sudo chown -R jenkins:jenkins * && sudo chown -R jenkins:jenkins .terraform'
       }
     }
   }
}
