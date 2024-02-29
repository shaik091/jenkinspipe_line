pipeline {
     agent any 
         environment{
            registry = 'arshad34/tomcat'
            registryCredential = 'dockerhub_id'
            dockerImage = ''
         }
     stages {
        stage('Build Java Code') {
            steps {
                echo "${BUILD_NUMBER}"
                 sh  'rm -f *.war *.WAR && bash build.sh && mv ROOT.war  ROOT${BUILD_NUMBER}.war '
                 sh  'ls -al'
            }
        }
        stage('Push Artifact to S3') {
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'arshadas', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '*.war', storageClass: 'STANDARD_IA', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'user-k8smngt', userMetadata: []
            }
        }
         stage('Building Docker Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }

            }
        }
           stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential) {
                        dockerImage.push()
                    }
                }

            }
        }
         stage('check terraform & packer version') {
            steps {
                sh 'terraform version'
                sh 'packer version'
            }
        }
     }

}
