pipeline {
  agent {
    node {
      label 'whnNote'
    }

  }
  stages {
    stage('static_test') {
      steps {
        bat 'dir'
        bat 'python D:\\jenkins_workspace\\static_test.py'
      }
    }

    stage('skyeye_test') {
      steps {
        bat 'python D:\\jenkins_workspace\\skyeye_test.py'
      }
    }

  }
  environment {
    python = 'D:\\install\\SkyEye\\lib\\python35'
  }
}