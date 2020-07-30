############################################
### Few additions to petclinic repo code ###
############################################

* Jenkinfile - Jenkins pipline [clone, build, execute test, package, image build, push to artifactory] 
* Dockerfile - docker file for image creation
* JCenter Repository - pom.xml nmodified to resolve dependecies from JCenter
* Artifactory - push jar to Artifactory 

###################################
### running jenkins pipeline  #####
###################################

* Update the content of the jenkinfile under source root to create jenkins pipeline

* update 
    ARTIFACTORY_URL
    ARTIFACTORY_USER_NAME
    ARTIFACTORY_PASSWORD 
    ARTIFACTORY_TARGET_REPO
  with your Artifactory credentials, URL  & target repo

* Use updated jenkinfile content to create the pipeline


###################################
#### Run docker image           ###
###################################

build the docker image using Dockerfile located at root of the source dir
* docker build -t image-name:version .
* docker run -p 8080:8080 image-name:version
* Access webpage by http://localhost:8080
