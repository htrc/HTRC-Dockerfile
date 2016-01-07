# Base image
FROM centos:7

MAINTAINER Data to Insight Center <d2i@indiana.edu>

# Update DNS servers
RUN echo "nameserver 8.8.8.8" >> /etc/resolve.conf

# Update the base system
RUN yum -y update && yum -y clean all

# Install wget
RUN yum -y install wget

# Install unzip
RUN yum -y install unzip