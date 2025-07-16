# -------- Build Stage --------
FROM eclipse-temurin:21-jdk AS builder

# Set working directory
WORKDIR /app

# Copy Maven files and source code
COPY pom.xml .
COPY src ./src

# Build the app (skip tests)
RUN ./mvnw clean install -DskipTests || mvn clean install -DskipTests

# -------- Run Stage --------
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy the built jar from builder stage
COPY --from=builder /app/target/research-assistant-0.0.1-SNAPSHOT.jar app.jar

# Set environment variable for Gemini key (Render will override)
ENV GEMINI_KEY=""

# Expose port
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
