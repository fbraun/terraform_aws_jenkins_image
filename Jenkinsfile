pipeline {   
  agent {
   dockerfile true  
  }
  stages {
    stage('init') {
      steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        AWS("--region=cn-north-1 s3 ls")
          
        sh 'terraform init'
      }

      //  sh 'curl http://169.254.169.254/latest/meta-data/iam/security-credentials/myrole'
      //    sh 'curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 2"'

      // sh 'TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`'
      // sh 'curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/iam/security-credentials/s3access'
        
     
          
     //  sh 'terraform init'
      }
    }
    stage('plan') {
      steps {
        sh 'terraform plan'
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
        sh 'terraform apply -auto-approve'
        cleanWs()
      }
    }
  }
}
