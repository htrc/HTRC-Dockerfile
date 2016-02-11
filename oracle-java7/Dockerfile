# Base image
FROM htrc/base

MAINTAINER Data to Insight Center <d2i@indiana.edu>

WORKDIR /opt

# Installing Oracle JDK 7
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm"
RUN yum -y localinstall jdk-7u79-linux-x64.rpm
RUN rm jdk-7u79-linux-x64.rpm

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/java/jdk1.7.0_79

# Copying JAVA_HOME to /etc/profile.d to use in other scripts
RUN echo "export JAVA_HOME=/usr/java/jdk1.7.0_79" > /etc/profile.d/java-env.sh
