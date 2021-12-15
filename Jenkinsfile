pipeline {
	agent any 
	environment {
                 SONARQUBE_LOGIN = "7feb11a80127b3e132ef98b518d67e4115959d1a"
         }

   	stages {
        	stage('Clone') {
			steps {
              			git 'https://github.com/silogwire/docker_karim.git'
       			 }
		}	
		stage('Build') {
                	steps {
	               		 sh 'mvn -B -DskipTests clean package'
       			 }
		}
         stage('Unit Tests') {
                steps {
                         sh 'mvn test'
                }
                post {
                    always {
                         junit 'target/surefire-reports/*.xml'
                    }
                }
         }

         stage('Integration Tests') {
                steps {
                         sh label: '', script: 'mvn verify -Dsurefire.skip=true'

                 }
                 post {
                         always {
                                 junit 'target/failsafe-reports/*.xml'
                         }
                         success {
                                  stash(name: 'artifact', includes: 'target/*.war')
                                  stash(name: 'pom', includes: 'pom.xml')
                                  // to add artifacts in jenkins pipeline tab (UI)
                                  archiveArtifacts 'target/*.war'
                         }
                 }
        }

	}
}
