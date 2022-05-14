#!/bin/bash

# update database
set -x ; sudo apt update
set +x

# https://docs.docker.com/engine/install/
# https://docs.docker.com/engine/install/ubuntu/
# https://docs.docker.com/compose/install/

# Docker Engine LTS
# https://docs.docker.com/release-notes/
DOCKER_LTS="5:20.10.14~3-0~ubuntu-focal"

# Docker Compose LTS
# https://docs.docker.com/release-notes/
DOCKER_COMPOSE_LTS="1.29.2"

# removing any old[er] docker installs
echo; echo "***** Remove old docker installs"
set -x ; sudo apt-get remove docker docker-engine docker.io containerd runc
set +x

# setup docker repo
# install packages to allow apt to use a repository over HTTPS
echo; echo "***** Install packages to allow repos over HTTPS"
set -x ; sudo apt-get install \
            ca-certificates \
            curl \
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

# install docker engine
echo; echo "***** Install docker"
set -x
# for the absolute latest:
#sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# install a specific version
sudo apt-get install docker-ce=$DOCKER_LTS docker-ce-cli=$DOCKER_LTS containerd.io -y
set +x

# add current user to the docker group
echo; echo "***** Add user to docker group"
set -x ; 
sudo usermod -aG docker $USERNAME
newgrp docker
set +x


# install docker-compose
echo; echo "***** Install Docker Compose"
set -x ; sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_LTS/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
set +x

# apply executable permissions to the binary
echo; echo "***** Make executable"
set -x ; sudo chmod +x /usr/local/bin/docker-compose
set +x

# versioning
echo; echo "***** Version"
docker --version
docker-compose --version

# hello-world
echo; echo "Should see the Docker Hello World app w/o sudo"
docker run hello-world
