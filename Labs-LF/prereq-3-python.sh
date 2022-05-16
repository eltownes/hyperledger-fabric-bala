#!/bin/bash

# update database
set -x ; sudo apt update
set +x

# https://docs.python-guide.org/

# install classic
sudo apt install python3-minimal

# version
python3-minimal --version
