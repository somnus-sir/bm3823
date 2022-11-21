pipeline {
  agent {
    node {
      label 'win10_631demo'
    }

  }
  stages {
    stage('test') {
      steps {
        bat 'ipconfig'
        bat 'dir'
        bat 'python D:\\jenkins_workspace\\workspace\\demo.py'
      }
    }

  }
  environment {
    python = 'C:\\SkyEye\\lib\\python35'
  }
}