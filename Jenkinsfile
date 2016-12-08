node ('dockerbuilder'){
    
   
    stage "Create build "
 //
        //sh "mv  /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS/Dockerfile-node-app /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS/Dockerfile"    
        printenv BUILD_NUMBER
         //echo $(env.BUILD_NUMBER)
         //sh  "docker run --name emp-nodejs-app -d  ajeeshdocker/emp-nodejs-app"
    //Stage "Checkout SCM"
        docker.withRegistry('', 'ajeeshdocker') {
    
        git url: "https://github.com/ajeeshgit/nginx-conf/", Branch: 'DevBranch', credentialsId: 'ajeeshgit'
       
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
       def app = docker.build "ajeeshdocker/emp-nginx-app"
    
        stage "publish"
        app.push 'latest'
        app.push "${commit_id}"
       
         sh "mkdir -p apps/api/priv/static/"
       // sh "chmod 755 ./versioncreator.sh"
       // sh "./versioncreator.sh"
     
    }
    
        //bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"""
//docker exec -d -u 0 emp-nodejs-app bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"
        //sh "mv Dockerfile Dockerfile-node-app"
       // sh "mv Dockerfile-nginx Dockerfile"
       // sh "docker build -t ""ajeeshdocker/nginx"" /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS"
       // sh "docker run --name emp-nginx-app -d -p  443:443 --link emp-nodejs-app:www.emp-nodejs-app.com ajeeshdocker/emp-nginx-app nginx"
         
           // Add version
       

    stage "Testing"
    echo "Stage Build starts"
    b=build( "Test_job_as_pipeline_downstream_project")
    
    
    
    
     
}
