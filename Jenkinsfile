pipeline {
    agent any
 
    environment {
        IMAGE = 'bucky0838/nodejs'
        GITOPS_REPO = 'https://github.com/Bucky0719/node-gitops.git'
        GIT_USER = 'Bucky0719'
        GIT_EMAIL = 'rahulnagarajan19@gmail.com'
        GIT_CREDENTIALS = 'github-creds'         
        DOCKER_CREDENTIALS = 'dockerhub-creds'  
    }
 
    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Bucky0719/node.js.git', branch: 'dev'
            }
        }
 
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE}:${BUILD_NUMBER}")
                }
            }
        }
 
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', "${DOCKER_CREDENTIALS}") {
                        docker.image("${IMAGE}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }
 
        stage('Update GitOps Repo') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${GIT_CREDENTIALS}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    git config --global user.name '${GIT_USER}'
                    git config --global user.email '${GIT_EMAIL}'
                    rm -rf node-gitops
                    git clone https://${USERNAME}:${PASSWORD}@github.com/Bucky0719/node-gitops.git
                    cd node-gitops/k8s
                    sed -i 's|image: .*|image: ${IMAGE}:${BUILD_NUMBER}|' deployment.yaml
                    git add deployment.yaml
                    git commit -m "Update image tag to ${BUILD_NUMBER}"
                    git push
                    """
                }
            }
        }
    }
}
