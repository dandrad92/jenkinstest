pipeline {
    agent any
    environment {
        NODE_HOME = '/usr/bin'
        PATH = "$NODE_HOME:$PATH"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/dandrad92/jenkinstest.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build Angular') {
            steps {
                sh 'npm run build --configuration=production --max-old-space-size=512'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t jenk-test:latest .
                '''
            }
        }
    }
}
