FROM 		docker-registry.htrc.indiana.edu/tomcat9

MAINTAINER Data to Insight Center <d2i@indiana.edu>

USER root

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


# Copy DC API war using gradle
ADD guacamole-client-build.gradle /opt/build.gradle
RUN /opt/gradle/latest/bin/gradle copyWar

WORKDIR /opt/tomcat/webapps/
RUN unzip -qq guacamole-client.war -d guacamole-client


# Create directory to keep DC API configuration files
RUN mkdir -p /etc/htrc/guacamole-client

WORKDIR /opt/tomcat

RUN chown -R tomcat webapps/

USER tomcat