From tomcat: 11.0-alpine
LABEL  maintainer='arshadshaik129@gmail.com'
ADD ROOT*.war /usr/local/tomcat/webapp/
EXPOSE 8080
CMD [ "cataline.sh", "run"]
