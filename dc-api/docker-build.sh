#!/bin/bash
version=$(../git-describe-remote.awk https://github.com/htrc/HTRC-DataCapsules.git)
echo " Version $version"
date=$(date +%Y%m%d)
docker build  --no-cache -t docker-registry.htrc.indiana.edu/dc-api:$version-$date  .
docker push docker-registry.htrc.indiana.edu/dc-api:$version-$date
docker tag docker-registry.htrc.indiana.edu/dc-api:$version-$date docker-registry.htrc.indiana.edu/dc-api:latest
docker push docker-registry.htrc.indiana.edu/dc-api:latest

