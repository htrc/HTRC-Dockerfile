FROM docker-registry.htrc.indiana.edu/java8

MAINTAINER Data to Insight Center <d2i@indiana.edu>

WORKDIR /opt

ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.1

# https://issues.apache.org/jira/browse/INFRA-8753?focusedCommentId=14735394#comment-14735394
ENV TOMCAT_TGZ_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN groupadd tomcat
RUN useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
RUN wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL"

RUN mkdir /opt/tomcat
RUN tar xvf tomcat.tar.gz -C /opt/tomcat --strip-components=1
WORKDIR /opt/tomcat
RUN chgrp -R tomcat /opt/tomcat
RUN chmod -R g+r conf
RUN chmod g+x conf
RUN chown -R tomcat webapps/ work/ temp/ logs/

USER tomcat

EXPOSE 8080
#CMD ["/opt/tomcat/bin/catalina.sh", "run"]
CMD sh /opt/tomcat/bin/catalina.sh start && tail -f /opt/tomcat/logs/catalina.out
