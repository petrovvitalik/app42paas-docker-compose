FROM maven:alpine as maven
ADD ./source /source
RUN cd /source && mvn clean && mvn install

FROM tomcat:latest
RUN mkdir /usr/local/tomcat/ROOT
COPY --from=maven /source/target/ /usr/local/tomcat/webapps
COPY --from=maven /source/WebContent /usr/local/tomcat/ROOT