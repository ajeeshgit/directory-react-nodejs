node {
    stage "Create build "
       
        sh "mv  /var/jenkins_home/workspace/directory-react-nodejs/Dockerfile-node-app /var/jenkins_home/workspace/directory-react-nodejs/Dockerfile"    
        sh  "docker build -t=""ajeeshdocker/nodejsapp""  /var/jenkins_home/workspace/directory-react-nodejs"
        sh  "docker run --name emp-nodejs-app -d  ajeeshdocker/emp-nodejs-app bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"""
//docker exec -d -u 0 emp-nodejs-app bash -c ""cd /empdirectory && nodejs /empdirectory/server.js"
        sh "mv Dockerfile Dockerfile-node-app"
        sh "mv Dockerfile-nginx Dockerfile"
        sh "docker build -t=ajeeshdocker/nginx /var/jenkins_home/workspace/directory-react-nodejs"
        sh "docker run --name emp-nginx-app -d -p  443:443 --link emp-nodejs-app:www.emp-nodejs-app.com ajeeshdocker/emp-nginx-app nginx"
         

     

    stage "Testing"
    
    
     
}
