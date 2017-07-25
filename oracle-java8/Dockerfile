# Base image
FROM htrc/base

MAINTAINER Data to Insight Center <d2i@indiana.edu>

# Installing Oracle JDK 8
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


# Copying JAVA_HOME to /etc/profile.d to use in other scripts
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" > /etc/profile.d/java-env.sh
