FROM ubuntu
MAINTAINER ekozhan <eko.z@hotmail.com>
ENV LANG C.UTF-8

COPY app/* /app/

RUN cd /app && chmod 755 * && \
./jdk-6u27-linux-x64.bin > /tmp/null && \
tar xzvf apache-tomcat-6.0.43.tar.gz > /tmp/null && \
mv apache-tomcat-6.0.43 tomcat && rm -rf tomcat/webapps/*

ENV JAVA_HOME /app/jdk1.6.0_27
ENV JAVA_OPTS -Xmn128m -Xms512m -Xmx512m -XX:MaxPermSize=256m
ENV CATALINA_HOME /app/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009
VOLUME "/app/tomcat/webapps"
WORKDIR /app/tomcat

# Launch Tomcat
CMD ["/app/tomcat/bin/catalina.sh", "run"]
