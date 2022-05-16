#!/bin/bash

# versioning
echo; echo "***** Version"
docker --version
docker-compose --version

# hello-world
echo; echo "Should see the Docker Hello World app w/o sudo"
docker run hello-world
