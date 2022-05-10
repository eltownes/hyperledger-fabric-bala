#!/bin/bash

# update database
set -x ; sudo apt update
set +x

# https://code.visualstudio.com/docs/setup/linux

# install classic
sudo snap install code --classic
