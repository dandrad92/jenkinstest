pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/dandrad92/jenkinstest.git'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Hello from Jenkins"'
            }
        }
    }
}
