FROM openjdk:17-oracle AS TEMP_BUILD_IMAGE
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY build.gradle settings.gradle gradlew $APP_HOME
COPY gradle $APP_HOME/gradle/
RUN microdnf install findutils
RUN ./gradlew build -x test

FROM openjdk:17-oracle
ENV APP_HOME=/usr/app
ARG JAR_PATH=./build/libs
WORKDIR $APP_HOME
COPY $JAR_PATH/$ARTIFACT_NAME .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "sagosip_home.jar"]