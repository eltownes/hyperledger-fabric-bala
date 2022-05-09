#!/bin/bash

# update database
set -x ; sudo apt update
set +x

# Docker Engine LTS
# https://docs.docker.com/release-notes/
DOCKER_LTS="5:20.10.14~3-0~ubuntu-focal"

# https://docs.docker.com/engine/install/

# Docker 
# https://docs.docker.com/engine/install/ubuntu/

# removing any old[er] docker installs
set -x ; sudo apt-get remove docker docker-engine docker.io containerd runc
set +x

# setup docker repo
# install packages to allow apt to use a repository over HTTPS
set -x ; sudo apt-get install \
            ca-certificates \
            curl \
            gnupg \
            lsb-release
set +x

# adding Docker’s official GPG key
set -x ; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
set +x

# setting up stable directory
set -x
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
set +x

# install docker engine
set -x
# for the absolute latest:
# sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo apt-get install docker-ce=$DOCKER_LTS docker-ce-cli=$DOCKER_LTS containerd.io -y
set +x

# add current user to the docker group
set -x ; sudo usermod -aG docker $USERNAME
set +x

# versioning
docker --version

# hello-world
echo "should see the Docker Hello World app w/o sudo"
docker run hello-world
