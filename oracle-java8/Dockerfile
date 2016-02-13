# Base image
FROM htrc/base:trusty

MAINTAINER HathiTrust Research Center <htrc-tech-help-l@list.indiana.edu>
LABEL description="Ubuntu Trusty base with Oracle Java 8"

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get -y install oracle-java8-installer oracle-java8-set-default --no-install-recommends

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
