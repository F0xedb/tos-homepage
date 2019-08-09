void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/F0xedb/tos-homepage"],
      contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/build-status"],
      errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}

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
    post {
        success {
            setBuildStatus("Build succeeded", "SUCCESS");
        }
        unstable {
            setBuildStatus("Build is unstable", "UNSTABLE");
        }
        failure {
            setBuildStatus("Build failed", "FAILED");
        }
        
    }
}
