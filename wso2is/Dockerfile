# Base image
FROM docker-registry.htrc.indiana.edu/java8

MAINTAINER Data to Insight Center <d2i@indiana.edu>

WORKDIR /opt

# Download and install gradle
RUN sleep 5s
RUN wget -cN http://services.gradle.org/distributions/gradle-3.4.1-all.zip
RUN sleep 5s
RUN unzip -od /opt/gradle gradle-3.4.1-all.zip
RUN sleep 5s
RUN ln -sfn gradle-3.4.1 /opt/gradle/latest
RUN printf "export GRADLE_HOME=/opt/gradle/latest\nexport PATH=\$PATH:\$GRADLE_HOME/bin\nexport GRADLE_INSTALLED_VERSION='3.4.1'" > gradle.sh
RUN chmod +x gradle.sh
RUN mv gradle.sh /etc/profile.d/
RUN . /etc/profile.d/gradle.sh

# Download and unzip wso2is-5.3.0
RUN wget http://analytics.hathitrust.org/files/wso2is-5.3.0.zip
RUN unzip wso2is-5.3.0.zip
RUN ln -s /opt/wso2is-5.3.0 /usr/local/wso2is

ADD scripts/run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

# Copy Registry Extension war using gradle
ADD scripts/regex-build.gradle /opt/build.gradle
RUN /opt/gradle/latest/bin/gradle copyWar

# Create directory to keep registry extension configuration files
RUN mkdir -p /etc/htrc/regex

# Add customized web pages
RUN mkdir -p /usr/local/wso2is/repository/deployment/server/webapps/authenticationendpoint
WORKDIR /usr/local/wso2is/repository/deployment/server/webapps/authenticationendpoint
RUN unzip /usr/local/wso2is/repository/deployment/server/webapps/authenticationendpoint.war
ADD *.jsp ./
ADD is-htrc-theme.css ./css

# Add mysql_connector to repository/components/dropins
ADD mysql_connector_java_5.1.42_bin_1.0.0.jar /usr/local/wso2is/repository/components/dropins/

# Add wso2is backup and restore webapp
ADD wso2br.war /usr/local/wso2is/repository/deployment/server/webapps/

# Create directory to keep wso2is configurations and resources
RUN mkdir -p /htrc/repository/wso2is

EXPOSE 9443

ENTRYPOINT /usr/local/bin/run.sh