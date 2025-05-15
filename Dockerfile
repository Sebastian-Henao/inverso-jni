FROM openjdk:23
VOLUME /tmp
EXPOSE 8080
ARG JAR_FILE=target/inverso-jni-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
RUN mkdir /root/aplicacion
COPY libinv.so /usr/local/lib/
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
ENTRYPOINT ["java", "-jar", "/app.jar"]