# Base image
FROM htrc/base:jessie

MAINTAINER HathiTrust Research Center <htrc-tech-help-l@list.indiana.edu>
LABEL description="Bamboo build agent image for HTRC"

COPY webupd8team-java.list /etc/apt/sources.list.d/
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 642AC823 && \
    apt-get update && \
    apt-get -y install oracle-java7-installer oracle-java8-installer oracle-java8-set-default sbt git --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle-jdk*-installer && \
    curl -fsSL https://raw.github.com/petervanderdoes/gitflow/develop/contrib/gitflow-installer.sh | bash -s install stable && \
    rm -rf gitflow

WORKDIR /usr/local

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle \
    MAVEN_VERSION=3.3.9 \
    MAVEN_HOME=/usr/local/maven3 \
    ANT_VERSION=1.9.6 \
    ANT_HOME=/usr/local/ant \
    BAMBOO_AGENT_VERSION=5.10.3 \
    BAMBOO_HOME=/root/bamboo-agent-home \
    BAMBOO_BASEURL=https://bamboo.htrc.illinois.edu

ENV PATH "$MAVEN_HOME/bin:$ANT_HOME/bin:$SBT_HOME/bin:$PATH"

# install Maven
RUN curl -fsSL http://apache.arvixe.com/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - && \
    ln -s apache-maven-$MAVEN_VERSION $MAVEN_HOME

# install Ant
RUN curl -fsSL http://apache.arvixe.com/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz | tar xzf - && \
    ln -s apache-ant-$ANT_VERSION $ANT_HOME

# set up Git
RUN git config --global --add user.name 'Docker remote Bamboo agent' && \
    git config --global --add user.email docker-bamboo@dev-tools.htrc.illinois.edu

# install Bamboo Agent
RUN curl -fsSL --create-dirs $BAMBOO_BASEURL/admin/agent/bamboo-agent-$BAMBOO_AGENT_VERSION.jar -o bamboo-agent/bamboo-agent.jar && \
    mkdir -p $BAMBOO_HOME

COPY bamboo-capabilities.properties $BAMBOO_HOME/

WORKDIR /root

# install the Bamboo Agent as a service under runit's supervision
COPY bamboo-agent.sh /etc/service/bamboo-agent/run

CMD [ "/sbin/my_init" ]
