#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Unexpected no. of arguments."
  echo "Usage: bash docker-build.sh warVersion dockerImageTag"
  echo "Examples: bash docker-build.sh 3.2.8-SNAPSHOT dev"
  echo "          bash docker-build.sh 3.2.8 prod"
  exit 1
fi

HTRC_SERVICE="agent"
VERSION=$1
TAG=$2

echo "Building docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$TAG ..."

docker build -t docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$TAG --build-arg VERSION=$VERSION .
