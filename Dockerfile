# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file into the container
COPY /var/lib/jenkins/workspace/nexus/target/my-app-1.0.0.jar my-app.jar

# Expose the application port (change if needed)
EXPOSE 8082

# Command to run the application
ENTRYPOINT ["java", "-jar", "my-app.jar"]
