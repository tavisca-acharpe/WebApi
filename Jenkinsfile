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
				bat 'dotnet restore ${SOLUTION_FILE_PATH} --source https://api.nuget.org/v3/index.json'
                bat 'dotnet build  ${SOLUTION_FILE_PATH} -p:Configuration=release -v:q'
            }
        }
        stage('Test') {
            steps {
              bat 'dotnet test ${TEST_PROJECT_PATH}'
            }
        }
        stage('Deploy') {
            steps {
               bat 'dotnet publish ${SOLUTION_FILE_PATH} -o Publish'
               
            }
        }
    }
}
