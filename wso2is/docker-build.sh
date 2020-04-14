#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Unexpected no. of arguments."
  echo "Usage: bash docker-build.sh warVersion dockerImageTag"
  echo "Examples: bash docker-build.sh 3.2.8-SNAPSHOT dev"
  echo "          bash docker-build.sh 3.2.8 prod"
  exit 1
fi

VERSION=$1
TAG=$2
docker build -t docker-registry.htrc.indiana.edu/wso2is:$TAG --build-arg VERSION=$VERSION .
