#!/bin/bash

# update database
set -x ; sudo apt update
set +x

# https://docs.docker.com/engine/install/
# https://docs.docker.com/engine/install/ubuntu/
# https://docs.docker.com/compose/install/

# Docker Engine LTS
# https://docs.docker.com/release-notes/
DOCKER_VER="5:20.10.16~3-0~ubuntu-focal"
#DOCKER_VER="5:20.10.16~3-0~ubuntu-jammy"

# Docker Compose LTS
# https://docs.docker.com/release-notes/
DOCKER_COMPOSE_VER="v2.5.0"
#DOCKER_COMPOSE_VER="2.5.0~ubuntu-focal"
#DOCKER_COMPOSE_VER="2.5.0~ubuntu-jammy"

# 
#DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
DOCKER_CONFIG="/usr/local/bin"

# removing any old[er] docker installs
echo; echo "***** Remove old docker & compose installs"
set -x ; 
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo rm $DOCKER_CONFIG/docker-compose
set +x

# setup docker repo
# install packages to allow apt to use a repository over HTTPS
echo; echo "***** Install packages to allow repos over HTTPS"
set -x ; sudo apt-get install \
            ca-certificates \
            gnupg \
            lsb-release
set +x

# adding Docker’s official GPG key
echo; echo "***** Add Docker PGP key"
set -x ; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
set +x

# setting up stable directory
echo; echo "***** Setup stable directory"
set -x
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
set +x

# update repo again
echo; echo "***** Re-Update Repo"
sudo apt update

# install docker engine
echo; echo "***** Install docker"
set -x
# latest:
#sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# specific version:
sudo apt-get install docker-ce=$DOCKER_VER docker-ce-cli=$DOCKER_VER containerd.io docker-compose-plugin
set +x


# install docker-compose
echo; echo "***** Install Docker Compose"
set -x ;
# specific version
sudo curl -SL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VER/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/docker-compose
set +x

# apply executable permissions to the binary
echo; echo "***** Make executable"
set -x ; sudo chmod +x $DOCKER_CONFIG/docker-compose
set +x

# add current user to the docker group
echo; echo "***** Add user to docker group"
set -x ; 
sudo usermod -aG docker $USERNAME
newgrp docker
set +x

# Installed
echo; echo "***** Installed"
echo "Docker: " $DOCKER_VER
echo "Docker Compose: " $DOCKER_COMPOSE_VER

# Repository
echo; echo "***** In Repo"
echo "Docker: " $(sudo apt-cache madison docker-ce)
echo "Docker Compose: " $(sudo apt-cache madison docker-compose-plugin)
