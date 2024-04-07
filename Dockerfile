FROM openjdk:17-oracle
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY build.gradle settings.gradle gradlew $APP_HOME
COPY gradle $APP_HOME/gradle/
RUN microdnf install findutils
RUN ./gradlew build

WORKDIR $APP_HOME
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "sagosip_home.jar"]