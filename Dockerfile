FROM registry.access.redhat.com/ubi8/openjdk-17 AS build
COPY --chown=jboss . .
RUN mvn clean package -DskipTests

FROM registry.access.redhat.com/ubi8/openjdk-17-runtime
COPY --from=build /home/jboss/target/hello-0.0.1-SNAPSHOT.jar hello.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "hello.jar"]