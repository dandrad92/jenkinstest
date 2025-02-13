pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/dandrad92/jenkinstest.git'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Hello Jenkins"'
            }
        }
    }
}
