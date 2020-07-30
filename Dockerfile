FROM openjdk:8-jdk-alpine
RUN addgroup -S petclinic && adduser -S petclinic -G petclinic
USER petclinic:petclinic
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} petclinic.jar
ENTRYPOINT ["java","-jar","/petclinic.jar"]
