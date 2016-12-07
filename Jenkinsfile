node ('dockerbuilder'){
    
    stage "Git checkout" 
        checkout scm
    stage "Create build "
 //
        sh "mv  /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS/Dockerfile-node-app /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS/Dockerfile"    
     
        sh  "docker run --name emp-nodejs-app -d  ajeeshdocker/emp-nodejs-app"
        //bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"""
//docker exec -d -u 0 emp-nodejs-app bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"
        //sh "mv Dockerfile Dockerfile-node-app"
       // sh "mv Dockerfile-nginx Dockerfile"
       // sh "docker build -t ""ajeeshdocker/nginx"" /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS"
       // sh "docker run --name emp-nginx-app -d -p  443:443 --link emp-nodejs-app:www.emp-nodejs-app.com ajeeshdocker/emp-nginx-app nginx"
         
           // Add version
        sh "mkdir -p apps/api/priv/static/"
        sh 'cat > temp.version <<- EOM "/n" { "metadata" : { "branch" : "$GIT_BRANCH", "commit" : "$GIT_COMMIT" },"version" : "5.6.0+$BUILD_NUMBER" } EOM '
     

    stage "Testing"
    echo "Stage Build starts"
    build( "Test_job_as_pipeline_downstream_project" )
    
    
    
     
}
