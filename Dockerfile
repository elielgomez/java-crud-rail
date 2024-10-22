FROM jelastic/maven:3.9.5-openjdk-21 as build
COPY . /app
WORKDIR /app

RUN  chmod +x mvnw
RUN ./mvnw package -DskipTests
RUN mv -f target/*.jar app.jar

FROM eclipse-temurin:21-jre
ENV PORT=${PORT}

COPY --from=build /app/app.jar .

RUN useradd runtime
USER runtime

ENTRYPOINT [ "java", "-DServer.port=${PORT}", "-jar", "app.jar" ]