FROM 		docker-registry.htrc.indiana.edu/tomcat9

MAINTAINER Data to Insight Center <d2i@indiana.edu>

# tomcat9 sets USER to tomcat, and WORKDIR to /opt/tomcat

USER root

# accept the agent war version as an argument
ARG VERSION

# environment variables
ENV GROUP_ID=edu.indiana.d2i.htrc
ENV ARTIFACT_ID=agent
ENV PACKAGING=war
ENV TOMCAT_DIR=/opt/tomcat

RUN \
  yum install -y openssh-clients && \
  yum clean all

# allow the user in the container to ssh to karst, and scp to and from karst
RUN echo -e "Host karst.uits.iu.edu\n\tIdentityFile /etc/htrc/agent/config/id_rsa\n\tStrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

# download the agent war from the HTRC nexus repo and place it in the
# appropriate tomcat directory
RUN \
  if [[ $VERSION == *"SNAPSHOT"* ]]; then REPO=snapshots; else REPO=releases; fi && \
  wget "http://nexus.htrc.illinois.edu/service/local/artifact/maven/content?g=$GROUP_ID&a=$ARTIFACT_ID&v=$VERSION&r=$REPO&p=$PACKAGING" --content-disposition && \
  mv $ARTIFACT_ID*.war $TOMCAT_DIR/webapps/$ARTIFACT_ID.war && \
  unzip -qq $TOMCAT_DIR/webapps/$ARTIFACT_ID.war -d $TOMCAT_DIR/webapps/$ARTIFACT_ID && \
  chown -R tomcat $TOMCAT_DIR/webapps/

# folder for configuration and other files used by the agent
RUN mkdir -p /etc/htrc/agent

USER tomcat

