//pipeline {
//    agent none
//
//    stages {
//        stage('Compile') {
//            steps {
//                    echo "Compiling..."
//                    sh "java -Dsbt.log.noformat=true -jar /var/jenkins_home/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/SBT_1.3.10_from_scala-sbt-org/bin/sbt-launch.jar compile"
//            }
//        }
//        stage('Build') {
//            agent {
//                dockerfile {
//                    filename "Dockerfile"
//                }
//            }
//            steps {
//                    sh "sbt clean"
//                    echo "Compiling..."
//                    sh "docker ps -a"
//            }
//        }
//    }
//}


//pipeline {
//    agent {
//        docker{
//            reuseNode true
//            image 'maven:3.5.0-jdk-8'
//        }
//    }
//
//    stages {
//        stage('Building image') {
//            steps {
//                script {
//                    sh "l -lia"
//                    docker build -t scala-helloworld .
//                    docker ps -a
//                }
//            }
//        }
//    }
//}

pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                    customImage.push()
                }
            }
        }
    }
}
