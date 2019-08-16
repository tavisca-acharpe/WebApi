pipeline {
    agent any
	parameters {		
			string(	name: 'GIT_SSH_PATH',
					defaultValue: "https://github.com/tavisca-acharpe/WebApi.git",
					description: '')

			string(	name: 'SOLUTION_FILE_PATH',
					defaultValue: "WebApplication2.sln", 
					description: '')

			string(	name: 'TEST_PROJECT_PATH',
					defaultValue: "XUnitTestProject1/WebApiXUnitTest.csproj", 
					description: '')
			string(	name: 'DEPLOY_PROJECT_PATH',
					defaultValue: "WebApplication2/Publish/WebApplication2.dll", 
					description: '')
    }
	
    stages {
        stage('Build') {
            steps {
				powershell '''dotnet restore WebApplication2.sln'''
            }
        }
        stage('Test') {
            steps {
                powershell 'dotnet test XUnitTestProject1/WebApiXUnitTest.csproj'
            }
        }
	    
	      stage('Publish') {
            steps {
		powershell 'dotnet publish ${SOLUTION_FILE_PATH} -o Publish'
		  
            }
        }
    }
}
