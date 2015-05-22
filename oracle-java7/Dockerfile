# Base image
FROM phusion/baseimage:0.9.16

MAINTAINER Data to Insight Center <d2i@indiana.edu>

# Copied from https://github.com/dockerfile/java
# Install Java.
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Copying JAVA_HOME to /etc/profile.d to use in other scripts
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-7-oracle" > /etc/profile.d/java-env.sh
RUN echo "export PATH=${JAVA_HOME}/bin:${PATH}" >> /etc/profile.d/java-env.sh

