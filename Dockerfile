FROM tomcat:8

COPY target/employee_app-1.war /usr/local/tomcat/webapps

ADD docker/tomcat/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
ADD docker/tomcat/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

CMD ["catalina.sh", "run"]
