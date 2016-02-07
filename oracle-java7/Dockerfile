# Base image
FROM htrc/base

MAINTAINER Data to Insight Center <d2i@indiana.edu>

WORKDIR /opt

# Installing Oracle JDK 7
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm"
RUN yum -y localinstall jdk-7u79-linux-x64.rpm
RUN rm jdk-7u79-linux-x64.rpm

ADD addtrustexternalcaroot.crt /opt/addtrust.crt
ADD USERTrustRSAAddTrustCA.crt /opt/usertrust.crt
ADD InCommonRSAServerCA_2.crt /opt/incommon.crt

RUN /usr/java/jdk1.7.0_79/bin/keytool -import -trustcacerts -keystore /usr/java/jdk1.7.0_79/jre/lib/security/cacerts -storepass changeit -noprompt -alias addtrust -file /opt/addtrust.crt
RUN /usr/java/jdk1.7.0_79/bin/keytool -import -trustcacerts -keystore /usr/java/jdk1.7.0_79/jre/lib/security/cacerts -storepass changeit -noprompt -alias usertrust -file /opt/usertrust.crt
RUN /usr/java/jdk1.7.0_79/bin/keytool -import -trustcacerts -keystore /usr/java/jdk1.7.0_79/jre/lib/security/cacerts -storepass changeit -noprompt -alias incommon -file /opt/incommon.crt

RUN rm /opt/addtrust.crt /opt/usertrust.crt /opt/incommon.crt

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/java/jdk1.7.0_79

# Copying JAVA_HOME to /etc/profile.d to use in other scripts
RUN echo "export JAVA_HOME=/usr/java/jdk1.7.0_79" > /etc/profile.d/java-env.sh
