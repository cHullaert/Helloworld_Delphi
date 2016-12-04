#!groovy

node {
	stage('Build') {
		echo "helloworld"
		checkout scm
		
		echo "${env.BDS}"
		withEnv(["BDS=C:\\Program Files (x86)\\Embarcadero\\RAD Studio\\7.0"]) {
			echo "${env.BDS}"
		}		
	}
}