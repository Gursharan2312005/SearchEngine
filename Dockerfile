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
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:9.0-jdk11
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/SearchEngine.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]