# Pull suitable image for openjdk8
# sudo docker pull tomcat:8.5.42-jdk8-openjdk
# FROM openjdk:8-jdk Base image
FROM tomcat:8.5.42-jdk8-openjdk

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
# Problems when using the Tomcat directories directly
#RUN \
#  mkdir -p "$CATALINA_HOME"/cnf ; \
#  mkdir -p "$CATALINA_HOME"/store ; \
#  mkdir -p "$CATALINA_HOME"/apphome ; 

RUN \
  mkdir -p /webapps ; \
  mkdir -p /conf ; \
  mkdir -p /tclib ; \
  mkdir -p /logs ; \
  mkdir -p /store ; \
  mkdir -p /apphome ;

WORKDIR $CATALINA_HOME

#
RUN \
apt-get update; \
apt-get install -y --no-install-recommends apt-utils ; \
apt-get install -y --no-install-recommends mg vim rsync cron ;
#

COPY etc/setup.local /etc/setup.local
COPY etc/catalina.sh $CATALINA_HOME/bin

#
EXPOSE 8080
CMD ["catalina.sh", "run"]
# Why doesn't the following CMD work?
#CMD ["catalina_prepared.sh", "run"]


# sudo docker build -t tyder/tomcat8542 .
# sudo docker run --name tomcat0 -it -p 8088:8080 --rm -d tyder/tomcat8542

# sudo docker exec -it tomcat0 /bin/bash
