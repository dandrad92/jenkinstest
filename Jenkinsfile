pipeline {
    agent any
    environment {
        NODE_HOME = '/usr/bin'
        PATH = "$NODE_HOME:$PATH"
        NPM_CACHE = "$WORKSPACE/.npm"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/dandrad92/jenkinstest.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm config set cache $NPM_CACHE'
                sh 'npm config set registry https://registry.npmmirror.com'
                sh 'npm install'
            }
        }
        stage('Build Angular') {
            steps {
                sh 'npm run build --configuration=production --max-old-space-size=512'
            }
        }
    }
}


