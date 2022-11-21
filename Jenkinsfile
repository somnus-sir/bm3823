pipeline {
  agent {
    node {
      label 'whnNote'
    }

  }
  stages {
    stage('test') {
      steps {
        bat 'ipconfig'
        bat 'dir'
        bat 'python D:\\jenkins_workspace\\demo.py'
      }
    }

  }
  environment {
    python = 'D:\\install\\SkyEye\\lib\\python35'
    git = 'D:\\install\\Git\\bin'
  }
}