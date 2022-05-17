#!/bin/bash

# update database
set -x ; sudo apt update
set +x

# versioning
echo; echo "***** Installed Versions"
docker --version
docker-compose --version

# Repository
echo; echo "***** Repo Versions"
echo "Docker: " $(apt-cache madison docker-ce)
echo
echo "Docker-Compose: " $(apt-cache madison docker-compose-plugin)

# hello-world
echo; echo "Should see the Docker Hello World app w/o sudo"
echo
docker run hello-world
