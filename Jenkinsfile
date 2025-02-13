pipeline {
    agent any
    environment {
        NODE_HOME = '/usr/bin' // Ajustar si Node.js está en otro directorio
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
                sh 'npm run build --prod'
            }
        }
    }
}

