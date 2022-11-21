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
      }
    }

  }
  environment {
    python = 'D:\\install\\SkyEye\\lib\\python35\\python.exe'
  }
}