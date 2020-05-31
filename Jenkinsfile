pipeline {
    agent any
    tools {
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
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