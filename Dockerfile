FROM amazoncorretto:11

COPY build/libs/gateway-*.jar boot.jar
COPY src/main/resources/application.yaml application.yaml

ENTRYPOINT ["java", "-jar", "boot.jar"]
