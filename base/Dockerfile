# Base image
FROM borice/base-jessie

MAINTAINER HathiTrust Research Center <htrc-tech-help-l@list.indiana.edu>
LABEL description="Debian base image for the HathiTrust platform services"

# Add required tools and libraries
RUN apt-get update && \
    apt-get -y install wget bzip2 unzip libapparmor1 && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8
