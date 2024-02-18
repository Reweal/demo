# Базовый образ для Java 17
FROM openjdk:17


#RUN apt-get update && apt-get install -y libglib2.0-0

# Копируем jar-файл в контейнер
COPY target/demo-*.jar /app.jar

# Устанавливаем порт, который будет использоваться в контейнере
EXPOSE 8080

# Запускаем приложение при старте контейнера с флагами для удаленной отладки
CMD ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5050", "-jar", "/app.jar"]