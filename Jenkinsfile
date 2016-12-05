#!groovy
										
def transformIntoBuildStep(inputString) {
	return {
		node {
			checkout scm
			bat "msbuild ${inputString} /v:d /target:build /p:config=Debug"
		}
	}
}

def transformIntoCleanStep(inputString) {
	return {
		node {
			bat "msbuild ${inputString} /v:d /target:clean /p:config=Debug"
		}
	}
}

def makeProjects(transformMethod) {
	// The map we'll store the parallel steps in before executing them.
	def stepsForParallel = [:]
	def projects = ["hw_delphi.dproj", "hw_console.dproj"] as String[]

	for (int iProject=0; iProject < projects.size(); iProject++) {
		def project=projects[iProject]
		def stepName="building ${projects[iProject]}"
		
		stepsForParallel[stepName] = transformMethod(project)
	}
	
	// Actually run the steps in parallel - parallel takes a map as an argument,
	// hence the above.
	parallel stepsForParallel
}

node {
	stage('Clean') {
		withEnv(["BDS=C:\\Program Files (x86)\\Embarcadero\\RAD Studio\\7.0",
				 "BDSCOMMONDIR=C:\\Users\\Public\\Documents\\RAD Studio\\7.0",
				 "FrameworkDir=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727",
				 "FrameworkVersion=v2.0.50727",
				 "FrameworkSDKDir=",
				 "PATH=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727;${env.PATH}",
				 "LANGDIR=FR",
				 "APPDATA=C:\\Users\\Christof\\AppData\\Roaming"]) {
	
			makeProjects({project -> transformIntoCleanStep(project)})
		}
	}

	stage('Build') {
		withEnv(["BDS=C:\\Program Files (x86)\\Embarcadero\\RAD Studio\\7.0",
				 "BDSCOMMONDIR=C:\\Users\\Public\\Documents\\RAD Studio\\7.0",
				 "FrameworkDir=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727",
				 "FrameworkVersion=v2.0.50727",
				 "FrameworkSDKDir=",
				 "PATH=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727;${env.PATH}",
				 "LANGDIR=FR",
				 "APPDATA=C:\\Users\\Christof\\AppData\\Roaming"]) {
	
			// just use the param like a variable in script
			echo "${SOFTWARE_PROTECTION}"
				
			makeProjects({project -> transformIntoBuildStep(project)})
		}
	}
}
