pipeline {
  agent {
    node {
      label 'whnNote'
    }

  }
  stages {
    stage('test') {
      steps {
        powershell 'echo "test"'
        powershell(script: 'cd D:\\jenkins_workspace', encoding: 'python skyeye_test.py')
        powershell 'python demo.py'
      }
    }

  }
  environment {
    python = 'D:\\install\\SkyEye\\lib\\python35\\python.exe'
  }
}