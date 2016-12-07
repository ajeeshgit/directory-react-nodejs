node ('dockerbuilder'){
    
    stage "Git checkout" 
        checkout scm
    stage "Create build "
 //
        sh "mv  /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS/Dockerfile-node-app /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS/Dockerfile"    
        sh  "docker build -t="ajeeshdocker/nodejsapp"  /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS"
        sh  "docker run --name emp-nodejs-app -d  ajeeshdocker/emp-nodejs-app bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"""
//docker exec -d -u 0 emp-nodejs-app bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"
        sh "mv Dockerfile Dockerfile-node-app"
        sh "mv Dockerfile-nginx Dockerfile"
        sh "docker build -t ""ajeeshdocker/nginx"" /home/ubuntu/jenkins_workspace/workspace/Test_job_Pipeline_AS"
        sh "docker run --name emp-nginx-app -d -p  443:443 --link emp-nodejs-app:www.emp-nodejs-app.com ajeeshdocker/emp-nginx-app nginx"
         

     

    stage "Testing"
    
  echo "Build Success"
    
     
}
