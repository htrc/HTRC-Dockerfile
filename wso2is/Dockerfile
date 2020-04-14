# Base image
FROM docker-registry.htrc.indiana.edu/java8

MAINTAINER Data to Insight Center <d2i@indiana.edu>

RUN groupadd idp
RUN useradd -s /bin/nologin -g idp -u 1488170 idp


WORKDIR /opt

# Download and unzip wso2is-5.3.0
RUN wget http://analytics.hathitrust.org/files/wso2is-5.3.0.zip
RUN unzip wso2is-5.3.0.zip
RUN ln -s /opt/wso2is-5.3.0 /usr/local/wso2is

ADD scripts/run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

# Copy Registry Extension war
# accept the ExtensionAPI war version as an argument
ARG VERSION

# environment variables
ENV GROUP_ID=edu.illinois.i3.htrc.registry
ENV ARTIFACT_ID=ExtensionAPI
ENV PACKAGING=war

RUN \
  if [[ $VERSION == *"SNAPSHOT"* ]]; then REPO=snapshots; else REPO=releases; fi && \
  wget "http://nexus.htrc.illinois.edu/service/local/artifact/maven/content?g=$GROUP_ID&a=$ARTIFACT_ID&v=$VERSION&r=$REPO&p=$PACKAGING" --content-disposition && \
  mv $ARTIFACT_ID*.war /usr/local/wso2is/repository/deployment/server/webapps/$ARTIFACT_ID.war

# Create directory to keep registry extension configuration files
RUN mkdir -p /etc/htrc/regex
RUN chown -R idp:idp /etc/htrc

# Add mysql_connector to repository/components/dropins
ADD mysql_connector_java_5.1.42_bin_1.0.0.jar /usr/local/wso2is/repository/components/dropins/

# Add wso2is backup and restore webapp
ADD wso2br.war /usr/local/wso2is/repository/deployment/server/webapps/

# Create directory to keep wso2is configurations and resources
RUN mkdir -p /htrc/repository/wso2is
RUN chown -R idp:idp /htrc

RUN chown -R idp:idp /opt/wso2is-5.3.0

USER idp

EXPOSE 9443

ENTRYPOINT /usr/local/bin/run.sh
