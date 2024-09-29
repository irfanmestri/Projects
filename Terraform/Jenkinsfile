pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')  // AWS Credentials stored in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/yeshwanthlm/Terraform-Jenkins.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression {
                    return params.DESTROY
                }
            }
            steps {
                sh 'terraform destroy'
            }
        }
    }

    post {
        always {
           node {
                cleanWs()
            }
        }
    }
}
