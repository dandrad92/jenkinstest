pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        NODE_HOME = '/usr/bin'
        PATH = "$NODE_HOME:$PATH"
        AWS_ACCOUNT_ID = "468541895299" // Reemplázalo con tu AWS Account ID
        AWS_REGION = "us-east-1" // Cambia si estás usando otra región
        ECR_REPOSITORY = "jenk-test"
        IMAGE_TAG = "latest"
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
        stage('Push to Amazon ECR') {
            steps {
                sh '''
                export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

                # Autenticarse en Amazon ECR
                aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                
                # Etiquetar la imagen para ECR
                docker tag jenk-test:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG
                
                # Subir la imagen al repositorio de Amazon ECR
                docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG
                '''
            }
        }
    }
}
