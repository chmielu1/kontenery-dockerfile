From tomcat

LABEL description="This is docker container which deploy ehour"

MAINTAINER Mateusz Chmielewski 

COPY ./src /opt

COPY ./src/mysql-connector-java-5.1.45-bin.jar /usr/local/tomcat/lib/

RUN sed -i 's/ehour.database.username=/ehour.database.username=ehour/' /opt/ehour-1.4.3/conf/ehour.properties && \
    sed -i 's/ehour.database.password=/ehour.database.password=qwerty/' /opt/ehour-1.4.3/conf/ehour.properties && \
    sed -i 's/127.0.0.1/mysql-server/' /opt/ehour-1.4.3/conf/ehour.properties && \
    echo "export EHOUR_HOME=\"/opt/ehour-1.4.3\"" > /usr/local/tomcat/bin/setenv.sh && \
    chmod +x /usr/local/tomcat/bin/setenv.sh
	


COPY ./src/ehour-1.4.3/app/ehour-1.4.3.war /usr/local/tomcat/webapps/

EXPOSE 8080
