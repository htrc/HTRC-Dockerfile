#!/bin/bash

docker pull mysql/mysql-server:5.7
docker tag mysql/mysql-server:5.7 docker-registry.htrc.indiana.edu/mysql