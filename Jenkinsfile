//pipeline {
//    agent {
//        dockerfile true
//    }
//    stages {
//        stage('Compile') {
//            steps {
//                    echo "Compiling..."
//                    sh "java -Dsbt.log.noformat=true -jar /var/jenkins_home/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/SBT_1.3.10_from_scala-sbt-org/bin/sbt-launch.jar compile"
//            }
//        }
//        stage('Build') {
//            steps {
//                    sh "sbt clean"
//                    echo "Compiling..."
//                    sh "docker ps -a"
//            }
//        }
//    }
//}
// REF: https://plugins.jenkins.io/sbt/

pipeline {
    agent {
        node {
            docker{
                reuseNode true
                image 'openjdk:8-jdk-alpine'
            }
        }
    }

    stages {
        stage('Building image') {
            steps {
                script {
                    docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
    }
}
