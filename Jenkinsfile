pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-python-app"
        DOCKER_REGISTRY = ""  // your-docker-hub-username/${IMAGE_NAME}
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Install Dependencies') {
            agent {
                docker { image 'python:3.9' }  // Use a Python Docker image
            }
            steps {
                echo 'Installing dependencies...'
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo 'Running unit tests...'
                sh 'pytest --junitxml=test-results.xml tests/'
            }
            post {
                always {
                    junit 'test-results.xml'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Push to Docker Registry') {
            steps {
                echo 'Pushing Docker image to registry...'
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    sh "docker tag ${IMAGE_NAME} ${DOCKER_REGISTRY}:latest"
                    sh "docker push ${DOCKER_REGISTRY}:latest"
                }
            }
        }

        stage('Deploy Application') {
            steps {
                echo 'Deploying application...'
                sh './scripts/deploy.sh'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
