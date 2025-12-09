#FROM maven:3.8.5-eclipse-temurin-17-alpine AS build
FROM registry.access.redhat.com/ubi8/openjdk-17:1.21-1.1744797574 AS build
WORKDIR /app

# Copy dependencies first for better layer caching
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests

#FROM eclipse-temurin:17-jre-alpine
FROM registry.access.redhat.com/ubi8/openjdk-17:1.21-1.1744797574 AS run

# Add metadata labels
LABEL maintainer="marcelobruckner" \
      version="0.0.1" \
      description="Hello App - Spring Boot Application"

WORKDIR /app

# Copy jar built in the previous stage
COPY --from=build /app/target/hello-0.0.1-SNAPSHOT.jar app.jar

# Switch to non-root user
USER jboss

EXPOSE 8080

# Add JVM optimization flags for containers
ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]
