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
        	 stage('Artifacts archive') {
               		 steps {
                                  stash(name: 'artifact', includes: 'target/*.war')
                                  stash(name: 'pom', includes: 'pom.xml')
                                  // to add artifacts in jenkins pipeline tab (UI)
                                  archiveArtifacts 'target/*.war'
                         }
                 }
               stage('Docker Build') {
                        steps {
                                sh 'docker build -t sihamlogwire/employee_app-1:1.0 .'
                         }
                }

                stage('Test Image') {
                        steps {
                                 sh 'docker run -tid -p  8081:8080 sihamlogwire/employee_app-1:1.0'
                         }
                }


                 stage('Docker Push') {
                        steps {
                                withCredentials([usernamePassword(credentialsId:'dockerHub',passwordVariable: 'dockerHubPassword',usernameVariable: 'dockerHubUser')]) {
                                        sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                                        sh 'docker push sihamlogwire/employee_app-1:1.0'
                                 }
                        }
                }
        }
}

