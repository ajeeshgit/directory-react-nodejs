

node ('dockerbuilder'){
    
   // stage 'deployment' demo for approval flow
    //input 'Do you approve deployment?'

    
    try 
    {
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

            docker.withRegistry('', 'ajeeshdocker')
                {
   
                    git url: "https://github.com/ajeeshgit/directory-react-nodejs/", Branch: 'Master', credentialsId: 'ajeeshgit'
       
                    //sh "git rev-parse HEAD > .git/commit-id"
                    //def commit_id = readFile('.git/commit-id').trim()
                    //println commit_id
                    def subject = "Job name is '${env.JOB_NAME}' build# is '${env.BUILD_NUMBER}' user is  '${env.CHANGE_AUTHOR}' Dispalyname is '${env.CHANGE_AUTHOR_DISPLAY_NAME}'"
                    def bnum = "'${env.BUILD_NUMBER}'"
                    notifySlack("$subject","$bnum","#gitcitest")
        
   
        
                     //       stage "build"
                      //     def app = docker.build "ajeeshdocker/emp-nginx-app"

                      //      stage "publish"
                      //      app.push 'latest'
                      //      app.push "5.6.0.$BUILD_NUMBER-master"

              
     
                }
    
 

             stage "Testing"
                echo "Stage Build starts"
                sh "echo ${env.BUILD_NUMBER}"
               // b=build( "Test_job_as_pipeline_downstream_project", DOCKER_QUEEN_TAG: "5.6.0.$BUILD_NUMBER-master" )
                paramAValue = "paramAValue"
                paramBValue = "paramBValue"
                build job: 'Test_job_as_pipeline_down_project', parameters: [[$class: 'StringParameterValue', name: 'ParamA', value: paramAValue], [$class: 'StringParameterValue', name: 'ParamB', value: paramBValue]]
               // b = build( "Test_job_as_pipeline_down_project")
                
                 
                
    
     
}

 //

catch (e)
        {
           text = "Fail"
             def subject = "Job name is '${env.JOB_NAME}' build# is '${env.BUILD_NUMBER}'"
             currentBuild.result = "FAILED"
             buildStatus = currentBuild.result
             notifySlack("$buildStatus","$subject","#gitcitest")
             
           throw e
        }
    
    finally {
    // Success or failure, always send notifications
        
        buildStatus = currentBuild.result
        buildStatus =  buildStatus ?: 'SUCCESSFUL'
         
        tagname = '${env.BUILD_NUMBER}'
        println tagname
        if (buildStatus == 'SUCCESSFUL')
              {
                  
                  sshagent (['87292f7c-ff10-44b4-9feb-83c73068d958']){ 
                                    sh ("git tag  -a -f -m 'tag is ${env.BUILD_NUMBER} ' '${env.BUILD_NUMBER}' ")
                                     sh ("git commit -m  test ")
                                    sh("git push origin '${env.BUILD_NUMBER}'") 
                                            }
                  sh 'git tag -l'
                    
                 // withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'ajeeshgit', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) 
                          //  {
                     
                     //sh ("git remote set-url origin https://github.com/ajeeshgit/directory-react-nodejs.git ")
                                
                                
                     
                    // sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ajeeshgit/directory-react-nodejs.git --tags')
                    // sh 'git --version'
                                
                  
                          //  }
                def bnum = "Job name is '${env.JOB_NAME}' build# is '${env.BUILD_NUMBER}'"
                notifySlack("$buildStatus","$bnum","#gitcitest")
              }
             
  }

}

   import groovy.json.JsonOutput
def notifySlack(text, bnum, channel) {
    
    println "text is ${text}"
   
    def slackURL = 'https://peeksters.slack.com/services/hooks/jenkins-ci?token=FDdQdnbrJfafDlc9yfJBamxR'
    def payload = JsonOutput.toJson([text      : text,
                                     bnum      : bnum,
                                     channel   : channel,
                                     icon_emoji: ":jenkins:"])
    sh "curl -X  POST --data-urlencode \'payload=${payload}\' ${slackURL}"
    
  
    
}     
      

