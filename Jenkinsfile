pipeline {
    agent {
        node {
           label 'AGENT-1'
        }
    }
    environment{
        COURSE = "jenkins"
        appVersion= ""
    }
    // options {
    //     timeout(time: 10, unit: 'SECONDS')
    //     disableConcurrentBuilds() 
    // }
    stages {
        stage('Read Version') {
            steps {
                script{
                    def packageJSON = readJSON file: 'package.json'
                    appVersion = packageJSON.version
                    echo "app version is: ${appVersion} "

                    
                }
            }
        }
        // poll scm
        stage('Install Dependencies') {
            steps {
                script{
                    sh """
                       npm install
                    """
                }
            }
        }
        stage('Deploy') {
            // input {
            //     message "Should we continue?"
            //     ok "Yes, we should."
            //     submitter "alice,bob"
            //     parameters {
            //         string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
            //     }
            // }
            when {
                expression { "$params.DEPLOY" == "true" }
            }
            steps {
                script{
                    sh """
                       echo "Building"
                    """
                }
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            cleanWs()
        }
        success {
           echo 'I will run if success'
        }
        failure {
            echo 'I will run if failure'
        }
        aborted {
            echo ' pipe line aborted'
        }
    }
}