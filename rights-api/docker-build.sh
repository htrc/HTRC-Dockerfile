#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Unexpected no. of arguments."
  echo "Usage: bash docker-build.sh warVersion dockerImageTag"
  echo "Examples: bash docker-build.sh 2.0.1-SNAPSHOT dev"
  echo "          bash docker-build.sh 2.0.1 prod"
  exit 1
fi

HTRC_SERVICE="rights-api"
VERSION=$1
TAG=$2

echo "Building docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$TAG ..."
docker build --no-cache -t docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$TAG --build-arg VERSION=$VERSION .

if [ $? -eq 0 ]; then
  MYDATE=$(date +%Y%m%d)
  # create a target image that refers to the above image, and has the tag 
  # "version-yyyymmdd"
  docker tag docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$TAG \
    docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$VERSION-$MYDATE

  # push both images to the HTRC docker registry
  echo "Pushing $HTRC_SERVICE:$TAG, $HTRC_SERVICE:$VERSION-$MYDATE into docker-registry.htrc.indiana.edu ..."
  docker push docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$TAG
  docker push docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$VERSION-$MYDATE

  # remove the docker image name with tag "version-yyyymmdd" from the local 
  # environment 
  # docker rmi docker-registry.htrc.indiana.edu/$HTRC_SERVICE:$VERSION-$MYDATE
fi

