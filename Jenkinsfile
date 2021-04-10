properties([pipelineTriggers([githubPush()])])

pipeline {
  agent any
    
  tools {nodejs "NodeJS"}
    
  stages {
        
    stage('Git') {
      steps {
        checkout scm
      }
    }
     
    stage('Build') {
      steps {
        sh 'rm -rf node_modules package-lock.json && npm install'
      }
    }  
    
            
    stage('Test') {
      steps {
	    sh 'npm uninstall puppeteer mocha chai'
		sh 'npm install puppeteer mocha chai'
		sh 'npm run start'
        sh 'npm test'
      }
    }
  }
}