#!groovy

// Take the string and echo it.
def transformIntoStep(inputString) {
	// We need to wrap what we return in a Groovy closure, or else it's invoked
	// when this method is called, not when we pass it to parallel.
	// To do this, you need to wrap the code below in { }, and either return
	// that explicitly, or use { -> } syntax.
	return {
		node {
			try {
				bat "msbuild ${inputString} /v:d /target:build /p:config=Debug"
			}
			catch (err){ 
					 stage 'Send Notification' 
					 mail (to: 'christof.hullaert@gmail.com', 
					 subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) has had an error.", 
						  body: "Some text", 
						mimeType:'text/html'); 
					 currentBuild.result = 'FAILURE' 
			} 
		}
	}
}


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
									
			def projects = ["hw_delphi.dproj", "hw_console.dproj"] as String[]
			
			// The map we'll store the parallel steps in before executing them.
			def stepsForParallel = [:]

			for (int iProject=0; iProject < projects.size(); iProject++) {
				def project=projects[iProject]
				def stepName="building ${projects[iProject]}"
				
				stepsForParallel[stepName] = transformIntoStep(project)
				
				//echo "Build: ${projects[iProject]}"
				//bat "msbuild ${projects[iProject]} /v:d /target:build /p:config=Debug"
			}
			
			// Actually run the steps in parallel - parallel takes a map as an argument,
			// hence the above.
			parallel stepsForParallel

		}		
	}
}