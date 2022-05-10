#!/bin/bash

. utils.sh

# update database
infoln "# Updating local database"
set -x ; sudo apt update
set +x

# typical repo must haves & useful tools
repoInstalls=("tmux" "tree")

# loop through the array
echo
for i in ${repoInstalls[@]}; do
   infoln "# Installing $i"
   set -x ; sudo apt install $i -y
   set +x
   echo
done

# report versioning
echo ; infoln "# Versions" ; echo
for i in ${repoInstalls[@]}; do
   infoln "$i"
   case $i in
      tmux)
         $i -V
         ;;
      *)
         $i --version
         ;;
   esac
   echo
done
