## docker kbase service 
	deploy kbase service with docker based on tomcat6, jdk6

### How to use
1. git pull docker-kbase
2. cd docker-kbase
3. docker build -t docker-kbase .
4. docker run -d -p 8080:8080 -p 8009:8009 -v /app/tomcat/webapps:/app/tomcat/webapps jetty
5. put projects like kbase-core into local directory /app/tomcat/webapps, make sure some address avaliable, and restart container, docker restart containerId.


