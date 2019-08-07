pipeline {
    agent {
              docker {
                 image 'jojomi/hugo:latest'
                  args '-v tos_work:/output'
               }
    }
    stages {
        stage('clone') {
            steps{
                git 'https://github.com/F0xedb/tos-homepage.git'
            }
        }
        stage('Build') {
            steps {
                sh 'cd src && hugo --destination="/output"'
            }
        }
    }
}
