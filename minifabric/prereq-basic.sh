#!/bin/bash

# update database
set -x ; sudo apt update
set +x

# typical repo must haves & useful tools
repoInstalls=("tmux" "tree")

# loop through the array
echo
for i in ${repoInstalls[@]}; do
   echo "***** Installing $i"
   set -x ; sudo apt install $i -y
   set +x
   echo
done

# report versioning
echo ; echo "***** Versions" ; echo
for i in ${repoInstalls[@]}; do
   echo "***** $i"
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
