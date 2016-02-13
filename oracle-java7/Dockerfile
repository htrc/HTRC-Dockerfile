# Base image
FROM htrc/base:trusty

MAINTAINER HathiTrust Research Center <htrc-tech-help-l@list.indiana.edu>
LABEL description="Ubuntu Trusty base with Oracle Java 7"

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get -y install oracle-java7-installer oracle-java7-set-default --no-install-recommends

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
