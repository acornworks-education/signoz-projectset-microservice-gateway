FROM amazoncorretto:11 AS builder

WORKDIR /home
COPY gradle gradle
COPY src src
COPY build.gradle build.gradle
COPY gradlew gradlew
COPY settings.gradle settings.gradle

RUN ./gradlew build -x test

FROM amazoncorretto:11 As runner

COPY --from=builder /home/build/libs/gateway-*.jar boot.jar
COPY src/main/resources/application.yaml application.yaml

ENTRYPOINT ["java", "-jar", "boot.jar"]
