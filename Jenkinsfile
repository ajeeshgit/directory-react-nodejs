node ('dockerbuilder'){
    
   
    stage "Create build "
 
    sh '''mkdir -p apps/api/priv/static/
        cat > apps/api/priv/static/version.json <<- EOM
        {
         "metadata" : {
           "branch" : "$GIT_BRANCH",
          "commit" : "$GIT_COMMIT"
         },
         "version" : "5.6.0+$BUILD_NUMBER"
        }
        EOM'''
    
    
    
    
        docker.withRegistry('', 'ajeeshdocker') {
    
        git url: "https://github.com/ajeeshgit/nginx-conf/", Branch: 'DevBranch', credentialsId: 'ajeeshgit'
       
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
 //       stage "build"
  //     def app = docker.build "ajeeshdocker/emp-nginx-app"
    
  //      stage "publish"
  //      app.push 'latest'
  //      app.push "5.6.0.$BUILD_NUMBER-master"
       
         sh "mkdir -p apps/api/priv/static/"
       // sh "chmod 755 ./versioncreator.sh"
       // sh "./versioncreator.sh"
     
    }
    
        
       

    stage "Testing"
    echo "Stage Build starts"
    sh "echo ${env.BUILD_NUMBER}"
   // b=build( "Test_job_as_pipeline_downstream_project", DOCKER_QUEEN_TAG: "5.6.0.$BUILD_NUMBER-master" )
    
    b = build( "Test_job_as_pipeline_down_project")
    param1 = "paramAValue"
    paramBValue = "paramBValue"
    build job: 'Test_job_as_pipeline_downstream_project', parameters: [[$class: 'StringParameterValue', name: 'Param1', value: paramAValue], [$class: 'StringParameterValue', name: 'ParamB', value: paramBValue]]
    
    
    
    
     
}
