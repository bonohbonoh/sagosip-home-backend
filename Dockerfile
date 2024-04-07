FROM openjdk:17-oracle
ENV ARTIFACT_NAME=sagosip_home.jar
WORKDIR /usr/src/app
ARG JAR_PATH=./build/libs
COPY ${JAR_PATH}/$ARTIFACT_NAME .
CMD ["java","-jar","sagosip_home.jar"]
