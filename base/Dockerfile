# Base image
FROM centos:latest

MAINTAINER Data to Insight Center <d2i@indiana.edu>

RUN yum -y update && yum -y clean all

# Install wget
RUN yum -y install wget

# Install unzip
RUN yum -y install unzip

# Install logrotate
RUN yum -y install logrotate

# Set time zone to ET
ENV TZ=America/Indianapolis
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
