pipeline {
    agent {
        docker {
            image 'jojomi/hugo:latest'
            args '-v tos_work:/output'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'hugo'
            }
        }
        stage('Deliver') {
            steps {
                sh './deliver.sh'
            }
        }
    }
}
