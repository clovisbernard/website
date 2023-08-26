pipeline {
    agent any

    // tools {
    //     // Define tool name and version
    //     maven 'Maven3'
    //     jdk 'JDK8'
    // }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the SCM
                checkout scm
            }
        }
    }

    post {
        always {
            // Cleanup after the build
            deleteDir()
        }
        success {
            echo 'Build was successful!'
        }
        failure {
            echo 'Build has failed!'
        }
    }
}
