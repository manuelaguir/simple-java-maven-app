# ----------- Build stage ----------- #
FROM maven:3.9.10-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven project
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# ----------- Runtime stage ----------- #
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/simple-java-maven-app-*.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
