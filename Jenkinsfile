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
        sh 'cd ..'
        sh 'python demo.py'
      }
    }

  }
  environment {
    python = 'C:\\SkyEye\\lib\\python35'
  }
}