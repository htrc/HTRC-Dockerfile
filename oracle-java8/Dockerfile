# Base image
FROM htrc/base

MAINTAINER Data to Insight Center <d2i@indiana.edu>

WORKDIR /opt

# Installing Oracle JDK 8
wget -nc --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jre-8u141-linux-x64.rpm"
yum -y install jre-8u141-linux-x64.rpm
rm jdk-8u141-linux-x64.rpm


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/java/default

# Copying JAVA_HOME to /etc/profile.d to use in other scripts
RUN echo "export JAVA_HOME=/usr/java/default" > /etc/profile.d/java-env.sh
