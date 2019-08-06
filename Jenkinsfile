pipeline {
    agent none
    stages {
        stage('clone') {
            agent {
              docker {
                 image 'jojomi/hugo:latest'
                  args '-v tos_work:/output'
               }
            }
            steps{
                git 'https://github.com/F0xedb/tos-homepage.git'
            }
        }
        stage('Build') {
            agent {
              docker {
                 image 'jojomi/hugo:latest'
                  args '-v tos_work:/output'
               }
            }
            steps {
                sh 'cd src && hugo --destination="/output"'
            }
        }
    }
}
