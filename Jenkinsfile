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
        bat 'cd D:\\jenkins_workspace'
        bat 'python demo.py'
      }
    }

  }
  environment {
    python = 'D:\\install\\SkyEye\\lib\\python35'
  }
}