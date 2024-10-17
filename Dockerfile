FROM openjdk:17-oracle
COPY target/AirlinesServices-0.0.1-SNAPSHOT.jar AirlineService.jar
CMD ["java","-jar","AirlineService.jar"]