FROM tomcat:9.0-jdk11

# Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Rename WAR for context path /Transworld
COPY target/Transworld-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/Transworld.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
