#!/bin/bash

directory="/home/$USER/dev/ic" 


base_directory=$(dirname "$directory")

if [ ! -d "$base_directory" ] || [ ! -d "$directory" ] 
then
    mkdir -p "$base_directory"

    # Clone the IC repo
    git -C "$base_directory" clone git@gitlab.com:dfinity-lab/public/ic.git
    git-branchless -C "$directory" init # Assumes you're using git-branchless
else 
    echo "Not cloning ic repo because $directory already exists"
fi


echo ""
echo "============"
echo ""

echo "The ic repo should be downloaded (in $directory)! Also, make sure to run `zsh`."