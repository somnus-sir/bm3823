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
      }
    }

  }
  environment {
    python = 'C:\\SkyEye\\lib\\python35'
    git = 'C:\\Program Files\\Git\\bin'
  }
}