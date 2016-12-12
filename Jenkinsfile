

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
   
                    git url: "https://github.com/ajeeshgit/nginx-conf/", Branch: 'DevBranch', credentialsId: 'ajeeshgit'
       
                    sh "git rev-parse HEAD > .git/commit-id"
                    def commit_id = readFile('.git/commit-id').trim()
                    println commit_id
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
        
        if (buildStatus == 'SUCCESSFUL')
              {
                tagname = "5.6.0.+'${env.BUILD_NUMBER}'"
                  sh 'echo $tagname'
                  sh 'git tag  -a -f -m "Jenkins Git plugin tagging with $tagname" 5.6.0.+'${env.BUILD_NUMBER}' '
                  sh 'git --version' 
                  sh 'git push git@github.com:ajeeshgit/directory-react-nodejs.git $tagname '
                  
                  
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
      

