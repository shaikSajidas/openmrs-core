FROM maven:3-jdk-8 as mavenbuild
RUN git clone https://github.com/shaikSajidas/openmrs-core.git && cd openmrs-core/ && mvn clean package

FROM tomcat:8
LABEL AUTHOR=sajida
EXPOSE 8080
VOLUME /root/.OpenMRS
COPY --from=mavenbuild /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
CMD ["catalina.sh", "run"]
