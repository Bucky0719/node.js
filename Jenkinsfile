pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "bucky0838/node.js_app:latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'dev', url: 'https://github.com/Bucky0719/FinacPlus.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Create a container') {
            steps {
                sh 'docker run -d -p 80:8080 --name nodejs-cont $DOCKER_IMAGE'
            }
        }

    }
}

