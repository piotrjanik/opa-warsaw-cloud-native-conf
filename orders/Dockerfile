FROM openjdk:12-jdk-alpine
COPY ./build/libs/app.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]