pipeline {   
  agent {
   dockerfile true  
  }
  stages {
    stage('checkout') {
      steps {
      
        sh 'docker pull hashicorp/terraform:light'
        
             }
    }
    stage('init') {
      steps {

        sh 'docker run apt-get update'
        sh 'docker run apt install python3-pip -y'
        sh 'docker run pip3 install awscli --upgrade'

          
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light init'
      }
    }
    stage('plan') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light plan'
      }
    }
    stage('approval') {
      options {
        timeout(time: 1, unit: 'HOURS') 
      }
      steps {
        input 'approve the plan to proceed and apply'
      }
    }
    stage('apply') {
      steps {
        sh 'docker run -w /app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light apply -auto-approve'
        cleanWs()
      }
    }
  }
}
