# Use Java 21 base image
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy built jar from target folder
COPY target/research-assistant-0.0.1-SNAPSHOT.jar app.jar

# Set environment variable for Gemini key (Render overrides this)
ENV GEMINI_KEY=""

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
