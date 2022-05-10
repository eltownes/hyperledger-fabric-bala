#!/bin/bash

. utils.sh

# update database
infoln "# Updating local database"
set -x ; sudo apt update
set +x

# https://code.visualstudio.com/docs/setup/linux

# install classic
sudo snap install code --classic
