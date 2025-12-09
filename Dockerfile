FROM maven:3.8.5-eclipse-temurin-17-alpine AS build
WORKDIR /app

# Copy dependencies first for better layer caching
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine

# Add metadata labels
LABEL maintainer="marcelobruckner" \
      version="0.0.1" \
      description="Hello App - Spring Boot Application"

WORKDIR /app

# Create non-root user for security (Alpine uses addgroup/adduser)
RUN addgroup -S appuser && adduser -S appuser -G appuser

# Copy jar with proper ownership
COPY --from=build --chown=appuser:appuser /app/target/hello-0.0.1-SNAPSHOT.jar app.jar

# Switch to non-root user
USER appuser

EXPOSE 8080

# Add JVM optimization flags for containers
ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]
