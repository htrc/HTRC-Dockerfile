FROM 		docker-registry.htrc.indiana.edu/tomcat9

MAINTAINER Data to Insight Center <d2i@indiana.edu>

USER root

WORKDIR /opt

# Download and install gradle
#RUN sleep 5s
#RUN wget -cN http://services.gradle.org/distributions/gradle-3.4.1-all.zip
#RUN sleep 5s
#RUN unzip -od /opt/gradle gradle-3.4.1-all.zip
#RUN sleep 5s
#RUN ln -sfn gradle-3.4.1 /opt/gradle/latest
#RUN printf "export GRADLE_HOME=/opt/gradle/latest\nexport PATH=\$PATH:\$GRADLE_HOME/bin\nexport GRADLE_INSTALLED_VERSION='3.4.1'" > gradle.sh
#RUN chmod +x gradle.sh
#RUN mv gradle.sh /etc/profile.d/
#RUN . /etc/profile.d/gradle.sh


# Copy email validator war using gradle
#ADD email-build.gradle /opt/build.gradle
#RUN /opt/gradle/latest/bin/gradle copyWar

ADD email-validator.war /opt/tomcat/webapps/

WORKDIR /opt/tomcat/webapps/
RUN unzip -qq email-validator.war -d email-validator
ADD log4j.properties email-validator/WEB-INF/classes/

# Create directory to keep email validator configuration files
RUN mkdir -p /etc/htrc/email-validator

WORKDIR /opt/tomcat

RUN chown -R tomcat webapps/

USER tomcat