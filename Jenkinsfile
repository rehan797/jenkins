pipeline {

agent {
        label "bulid_node"
    }

stages {

stage('SCM') {
	steps 	{ 
		echo "git pull"
		git branch: 'main', url: 'https://github.com/rehan797/jenkins.git'
	}
}
stage('Build Images') {
	steps {	 		
		sh "sudo docker build -t rehan797/new_web:${BUILD_NUMBER} ."  	 
	}
}
stage ('Push to docker hub') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_HUB', variable: 'Docker_password')]) {
    // some block
                sh "sudo docker login -u rehan797 -p $Docker_password"
}
                sh "sudo docker push rehan797/new_web:${BUILD_NUMBER}"
            }

        }

		stage ('Launching the server in Dev Env') {
            steps {
                sh 'sudo docker rm -f Web_App'
                sh "sudo docker run -d -p 80:80 --name Web_App rehan797/new_web:${BUILD_NUMBER} "
            }

        } 


	}

}
