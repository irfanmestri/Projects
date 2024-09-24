pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')   // Jenkins credentials
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/irfanmestri/projects.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            node {
                cleanWs() // Clean workspace after build
            }
        }
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
