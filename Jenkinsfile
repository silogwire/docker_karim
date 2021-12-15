pipeline {
	agent any 
	environment {
                 SONARQUBE_LOGIN = "7feb11a80127b3e132ef98b518d67e4115959d1a"
         }

   	stages {
        	stage('Clone') {
			steps {
              			git 'git@github.com:silogwire/docker_karim.git'
       			 }
		}	
		stage('Build') {
                	steps {
	               		 sh 'mvn  -B -DskipTests clean package'
       			 }
		}
	}
}
