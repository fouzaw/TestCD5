<<<<<<< HEAD

=======
Contenu du fichier :
# Étape 1 : construire le projet
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app

# Copier les fichiers de configuration et le code source
COPY pom.xml .
COPY src ./src
# Construire le jar
RUN mvn clean package -DskipTests
# Étape 2 : créer l'image finale
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
# Copier le jar depuis l'étape de build
COPY --from=build /app/target/*.jar app.jar
# Exposer le port utilisé par Spring Boot
EXPOSE 8080
# Commande pour démarrer l'application
ENTRYPOINT ["java","-jar","/app.jar"]
>>>>>>> 7559266 (eeed)
