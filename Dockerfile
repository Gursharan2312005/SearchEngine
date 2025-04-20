FROM maven:3.8.4-openjdk-8 as builder

# Set working directory
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src
COPY web ./web

# Build the application
RUN mvn clean package

# Runtime stage
FROM openjdk:8-jre-slim

# Set working directory
WORKDIR /app

# Copy WAR file and webapp runner
COPY --from=builder /app/target/*.war /app/
COPY --from=builder /app/target/dependency/webapp-runner.jar /app/

# Expose port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "webapp-runner.jar", "--port", "8080", "*.war"] 