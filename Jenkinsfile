properties([pipelineTriggers([githubPush()])])

pipeline {
  agent any
    
  tools {nodejs "NodeJS"}
    
  stages {
        
    stage('Git') {
      steps {
        git 'https://github.com/sathya1104/one2onetool.git'
      }
    }
     
    stage('Build') {
      steps {
        sh 'rm -rf node_modules package-lock.json && npm install'
      }
    }  
    
            
    stage('Test') {
      steps {
        sh 'node test'
      }
    }
  }
}