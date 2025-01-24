pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "bucky0838/node.js_app:latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Bucky0719/FinacPlus.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker login -u bucky0838 -p dckr_pat_79C2h7PDN21tTnkWp-4-xSNlHIg'
                sh 'docker push $DOCKER_IMAGE'
            }
        }

    }
}

