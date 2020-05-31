pipeline {
    agent any
    tools {
        docker '18.09'
    }
    environment {
        DOCKER_CERT_PATH = credentials('dockerhub')
    }

    stages {
        stage('foo') {
            steps {
                sh "docker version" // DOCKER_CERT_PATH is automatically picked up by the Docker client
            }
        }
    }
}