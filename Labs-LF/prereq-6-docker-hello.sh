#!/bin/bash

# versioning
echo; echo "***** Version"
docker --version
docker-compose --version

# Repository
sudo apt update
echo; echo "***** Repo Versions"
echo "Docker: " $(apt-cache madison docker-ce)
echo
echo "Docker-Compose: " $(apt-cache madison docker-compose-plugin)

# hello-world
echo; echo "Should see the Docker Hello World app w/o sudo"
docker run hello-world
