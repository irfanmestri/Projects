pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')   // Jenkins credentials
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git branch: 'main', url: 'https://github.com/irfanmestri/projects.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Run Terraform Plan to see the changes
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply Terraform to create resources
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            cleanWs() // Clean workspace after build
        }
        success {
            echo 'EC2 instance created successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
