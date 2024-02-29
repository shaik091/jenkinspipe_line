pipeline {
     agent any 
     stages {
        stage('Build Java Code') {
            steps {
                echo "${BUILD_NUMBER}"
                 sh  'rm -f *.war *.WAR && bash build.sh && mv ROOT.war  ROOT${BUILD_NUMBER}.war'
                 sh  'ls -al'
            }
        }

     }

}
