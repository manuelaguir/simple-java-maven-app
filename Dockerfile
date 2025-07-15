FROM eclipse-temurin:21-jdk-alpine

# Copy the jar from the build stage
COPY target/simple-java-maven-app-*.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
