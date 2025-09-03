# Stage 1: Build JAR
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml aur dependency cache
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code aur build JAR
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run JAR
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
