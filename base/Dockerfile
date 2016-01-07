# Base image
FROM centos:7

MAINTAINER Data to Insight Center <d2i@indiana.edu>

# Update the base system
RUN yum -y update && yum -y clean all

# Install wget
RUN yum -y install wget

# Install unzip
RUN yum -y install unzip