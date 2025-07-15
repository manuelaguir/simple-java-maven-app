FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
# Copy the jar from the build stage
COPY target/my-app-*.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
