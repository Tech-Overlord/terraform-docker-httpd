pipeline {
   agent any
   stages {
     stage('Terraform Plan') {
       steps {
          sh 'sudo terraform init'
          sh 'sudo terraform plan -var "env=prod" -out=plan'
       }
     }
     stage('Terraform Apply') {
       steps {
         input 'Does the terraform execution plan look good to be applied?'
         milestone(1)
         sh 'sudo terraform apply "plan"'
         sh 'sudo -R chown jenkins:jenkins *'
       }
     }
   }
}
