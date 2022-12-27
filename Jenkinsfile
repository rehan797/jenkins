pipeline {

agent any

stages {

stage('SCM') {
	steps 	{ 
		echo "git pull"
		git branch: 'main', url: 'https://github.com/rehan797/jenkins.git'
	}
}
stage('deploy') {
	steps {	 		
		sh 'sudo cp index.html /var/www/html'  	 
	}
}
stage('Test') {
	steps { 
		echo "Deployed the code "
	}
}

	}

}