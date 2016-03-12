# Base image
FROM frolvlad/alpine-glibc

MAINTAINER Data to Insight Center <d2i@indiana.edu>

RUN apk add --update wget unzip && rm -rf /var/cache/apk/*

# Install dumb-init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64
RUN chmod +x /usr/local/bin/dumb-init
