#!groovy

node {
	stage('Build') {
		echo "helloworld"
		checkout scm

		withEnv(["BDS=C:\\Program Files (x86)\\Embarcadero\\RAD Studio\\7.0",
				 "BDSCOMMONDIR=C:\\Users\\Public\\Documents\\RAD Studio\\7.0",
				 "FrameworkDir=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727",
				 "FrameworkVersion=v2.0.50727",
				 "FrameworkSDKDir=",
				 "PATH=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727;${env.PATH}",
				 "LANGDIR=FR",
				 "APPDATA=C:\\Users\\Christof\\AppData\\Roaming"]) {
			
			echo "BDS: ${env.BDS}"
			echo "BDSCOMMONDIR: ${env.BDSCOMMONDIR}"
			echo "FrameworkDir: ${env.FrameworkDir}"
			echo "FrameworkVersion: ${env.FrameworkVersion}"
			echo "FrameworkSDKDir: ${env.FrameworkSDKDir}"
			echo "Path: ${env.PATH}"
			echo "LangDir: ${env.LANGDIR}"
			echo "AppData: ${env.APPDATA}"
		}		
	}
}