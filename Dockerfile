FROM openjdk:21
VOLUME /tmp
EXPOSE 8080

# Este es el archivo .jar generado con el comando Maven
ARG JAR_FILE=target/inverso-jni-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar

# Copia la librería compartida al contenedor
COPY libinversojni.so /lib64/

# Configura la ruta de la librería para que Java pueda cargarla correctamente
ENV LD_LIBRARY_PATH=/lib64:$LD_LIBRARY_PATH

# Ejecuta la aplicación
ENTRYPOINT ["java", "-Djava.library.path=/lib64", "-jar", "/app.jar"]
