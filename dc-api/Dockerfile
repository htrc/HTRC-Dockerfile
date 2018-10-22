FROM 		docker-registry.htrc.indiana.edu/tomcat9

MAINTAINER Data to Insight Center <d2i@indiana.edu>

USER root

# accept the agent war version as an argument
ARG VERSION

# environment variables
ENV GROUP_ID=edu.indiana.d2i.sloan
ENV ARTIFACT_ID=sloan-ws
ENV PACKAGING=war
ENV TOMCAT_DIR=/opt/tomcat

WORKDIR /opt

# download the agent war from the HTRC nexus repo and place it in the
# appropriate tomcat directory
RUN \
  if [[ $VERSION == *"SNAPSHOT"* ]]; then REPO=snapshots; else REPO=releases; fi && \
  wget "http://nexus.htrc.illinois.edu/service/local/artifact/maven/content?g=$GROUP_ID&a=$ARTIFACT_ID&v=$VERSION&r=$REPO&p=$PACKAGING" --content-disposition && \
  mv $ARTIFACT_ID*.war $TOMCAT_DIR/webapps/$ARTIFACT_ID.war && \
  unzip -qq $TOMCAT_DIR/webapps/$ARTIFACT_ID.war -d $TOMCAT_DIR/webapps/$ARTIFACT_ID && \
  chown -R tomcat $TOMCAT_DIR/webapps/


# Create directory to keep DC API configuration files
RUN mkdir -p /etc/htrc/dcapi

USER tomcat