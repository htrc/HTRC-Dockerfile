# Base image
FROM htrc/java8

MAINTAINER Data to Insight Center <d2i@indiana.edu>

WORKDIR /opt

RUN wget http://analytics.hathitrust.org/files/wso2is-5.3.0.zip
RUN unzip wso2is-5.3.0.zip
RUN ln -s /opt/wso2is-5.3.0 /usr/local/wso2is

ADD scripts/run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 9443

CMD /usr/local/wso2is/bin/wso2server.sh

ENTRYPOINT /usr/local/bin/run.sh