#!/usr/bin/env groovy

pipeline {
   agent any
   parameters {
      choice(
        choices: ['apply' , 'destroy'],
        description: 'You may choose the specific terraform action you need to perform (for e.g. terraform plan, terraform apply or terraform destroy)',
        name: 'TERRAFORM_ACTION')
      string(
        name: 'TERRAFORM_RESOURCE',
        description: 'Provide the resource name that "TERRAFORM_ACTION" will be applied against.')
     }
   stages {
     stage('Terraform Plan') {
      steps {
          sh "terraform init"
          sh "terraform plan -target ${params.TERRAFORM_RESOURCE}"
          //sh "sudo chown -R jenkins:jenkins * && sudo chown -R jenkins:jenkins .terraform"
      }
     }
     stage('Terraform Apply') {
      when {
            expression { params.TERRAFORM_ACTION == 'apply' }
          }
      steps {
         input 'Does the terraform execution plan look good to be applied?'
         milestone(1)
         sh "terraform apply -target ${params.TERRAFORM_RESOURCE} -auto-approve"
         //sh "sudo chown -R jenkins:jenkins * && sudo chown -R jenkins:jenkins .terraform"
      }
     }
     stage('Terraform Destroy') {
      when {
            expression { params.TERRAFORM_ACTION == 'destroy' }
          }
      steps {
         input 'Are you sure you want to destroy the terraform resources?'
         milestone(2)
         sh "terraform destroy -target ${params.TERRAFORM_RESOURCE} -auto-approve"
         //sh "sudo chown -R jenkins:jenkins * && sudo chown -R jenkins:jenkins .terraform"
      }
     }
   }
}