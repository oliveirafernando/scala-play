pipeline {
    agent any
    stages {
        stage('Compile') {
            steps {
                    echo "Compiling..."
                    sh "java -Dsbt.log.noformat=true -jar /var/jenkins_home/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/SBT_1.3.10_from_scala-sbt-org/bin/sbt-launch.jar compile"
            }
        }
        stage('Build') {
            agent {
                docker { 
                    image 'oliveirafernando/sbt-base:1.2.8'
                }
            }
            steps {
                    sh "sbt clean"
                    echo "Compiling..."
                    sh "docker ps -a"
            }
        }
    }
}

// REF: https://plugins.jenkins.io/sbt/
