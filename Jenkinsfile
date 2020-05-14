/* uses sbt, which i installed with homebrew. */
/* this works without requiring the 'sbt plugin'. */

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Compiling..."
                sh "${tool name: 'sbt', type: 'org.jvnet.hudson.plugins.SbtPluginBuilder$SbtInstallation'}/usr/local/bin/sbt compile"
            }
        }
    }
}