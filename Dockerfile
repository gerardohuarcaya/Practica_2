# Etapa de compilación: el proyecto usa Jakarta Servlet (Tomcat 10.1).
FROM tomcat:10.1-jdk17-temurin AS build

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/java ./src/java
COPY web ./web

# Driver JDBC moderno; se incluye dentro del WAR para que Tomcat lo encuentre.
RUN mkdir -p web/WEB-INF/lib \
    && curl -fsSL https://repo.maven.apache.org/maven2/com/mysql/mysql-connector-j/9.7.0/mysql-connector-j-9.7.0.jar \
       -o web/WEB-INF/lib/mysql-connector-j-9.7.0.jar \
    && find src/java -name "*.java" > sources.txt \
    && mkdir -p classes war/WEB-INF/classes \
    && javac -encoding UTF-8 -cp "$CATALINA_HOME/lib/servlet-api.jar" -d classes @sources.txt \
    && cp -R web/. war/ \
    && cp -R classes/. war/WEB-INF/classes/ \
    && jar -cf ROOT.war -C war .

FROM tomcat:10.1-jdk17-temurin

RUN rm -rf "$CATALINA_HOME/webapps/"*

COPY --from=build /app/ROOT.war "$CATALINA_HOME/webapps/ROOT.war"

EXPOSE 10000

# Render asigna el puerto mediante PORT; Tomcat debe escuchar en ese puerto.
CMD ["sh", "-c", "sed -i 's/port=\"8080\"/port=\"${PORT:-10000}\"/' \"$CATALINA_HOME/conf/server.xml\" && catalina.sh run"]
