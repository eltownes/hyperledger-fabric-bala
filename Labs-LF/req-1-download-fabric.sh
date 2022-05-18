#!/bin/bash

cd ~/Desktop/

if [[ $# -ne 2 ]] ; then
  echo "# Need 2 versions as arguments - e.g. 2.2.1 1.4.9"
else
  FABRIC_VERSION="$1"
  FABRIC_CA_VERSION="$2"

  # install fabric
  echo; echo "***** running the HF script - pulling down binaries & images"
  set -x 
  curl -sSL https://bit.ly/2ysbOFE | bash -s --$FABRIC_VERSION $FABRIC_CA_VERSION
  set +x 

  # add downloaded binaries to PATH
  export PATH=$PWD/bin:$PATH
  export PATH=${PWD}/../bin:$PATH
fi
