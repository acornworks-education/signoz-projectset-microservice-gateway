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
COPY src/main/resources/application-k8s.yaml application-k8s.yaml
COPY lib/opentelemetry-javaagent.jar opentelemetry-javaagent.jar

ENV OTEL_METRICS_EXPORTER=none
ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_RESOURCE_ATTRIBUTES=service.name=gateway,service.group=acornworks

ENTRYPOINT ["java", "-javaagent:opentelemetry-javaagent.jar", "-jar", "boot.jar"]
