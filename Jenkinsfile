def DOCKER_REGISTRY_URI="https://registry.hub.docker.com"
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
     
	stage('Docker Build and Tag') {
       steps {
          
            sh 'docker build -t one2onetool:latest .' 
            sh 'docker tag one2onetool sathya1104/one2onetool:latest'
            //sh 'docker tag one2onetool sathya1104/one2onetool:$BUILD_NUMBER'
            sh 'docker images | grep one2onetool'
       }
    }
	/*
	stage('Publish image to Docker Hub') {
         steps {
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
		 	  sh "docker login --password=${PASSWORD} --username=${USERNAME} ${DOCKER_REGISTRY_URI}"
			 // sh "docker push sathya1104/one2onetool:latest"
		    }     
         }
    }
	*/
    stage('Run Docker container on Jenkins Agent') {  
        steps {
		   // sh "docker kill 1to1tool"
         //  sh "docker run --name 1to1tool -d -p 3000:3000 sathya1104/one2onetool:$BUILD_NUMBER"
		   sh "docker run --name 1to1tool -d -p 3000:3000 sathya1104/one2onetool:latest"
        }
    }	
	
  }
  
  post {
        failure {
            mail to:"sathya1104@gmail.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
        }
    }
  
}
