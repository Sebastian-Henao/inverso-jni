FROM openjdk:23
VOLUME /tmp
EXPOSE 8080
ARG JAR_FILE=target/inverso-jni-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
RUN mkdir /root/aplicacion
COPY lib/libinv.so /lib64
COPY lib/cjson/* /lib64
ENV LD_LIBRARY_PATH=/USR/LOCAL/LIB/JNI:/lib64:$LD_LIBRARY_PATH
ENTRYPOINT ["java", "-jar", "/app.jar"]