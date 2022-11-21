pipeline {
  agent {
    node {
      label 'whnNote'
    }

  }
  stages {
    stage('') {
      steps {
        powershell(script: 'cd D:\\jenkins_workspace', encoding: 'python skyeye_test.py')
      }
    }

  }
  environment {
    python = 'D:\\install\\SkyEye\\lib\\python35\\python.exe'
  }
}