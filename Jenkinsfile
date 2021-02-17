node {
  environment {
      BUILD_NUMBER = '1.0.0'
  }
  
  stage('Clone PetClinic') {
    //Clone spring-petclinic project from GitHub repository
    git branch: 'master',
        url:    'https://github.com/vishalnigam/spring-petclinic.git'
  }
  
  stage('Build & Install') {
    //run mvn wrapper for build, install and package
    sh './mvnw -B -DskipTests clean install'
  }
  
  stage('Run Tests') {
    //run all the Junit test
    sh './mvnw test'
    junit 'target/surefire-reports/*.xml'
  }
  
  stage('Package App') {
    //package application
    sh './mvnw package'
  }
  
  stage('Create Image - mvnw'){
    //Create pet-clinic application image
    sh './mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=pet-clinician-spring-boot-image'  
  }
  
  stage('Create Image - Dockerfile'){
    //Create pet-clinic application image
    sh 'docker build -t petclinic:$BUILD_NUMBER .'  
  }
  
  stage('Publish To Artifactory'){ 
   def server = Artifactory.newServer url: 'ARTIFACTORY_URL', username: 'ARTIFACTORY_USER_NAME', password: 'ARTIFACTORY_PASSWORD'
   def uploadSpec = """{
       "files": [
            { 
              "pattern": "target/*.jar",
              "target" : "ARTIFACTORY_TARGET_REPO",
              "props"  : "Unit-Tested=Yes"
            }
        ]
      }"""
    server.upload(uploadSpec)
   }
}
