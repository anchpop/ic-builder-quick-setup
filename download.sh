#!/bin/bash

directory="/home/$USER/dev/ic" 


base_directory=$(dirname "$directory")

if [ ! -d "$base_directory" ] || [ ! -d "$directory" ] 
then
    mkdir -p "$base_directory"

    # Clone the IC repo
    git -C "$base_directory" clone git@gitlab.com:dfinity-lab/public/ic.git
    git-branchless -C "$directory" init # Assumes you're using git-branchless

    # setup direnv
    echo "use nix" >> "$directory/rs/.envrc"
    direnv allow "$directory/rs"

    # setup precommit
    (cd "$directory"; pre-commit install)
    
else 
    echo "Not cloning ic repo because $directory already exists"
fi


echo ""
echo "============"
echo ""

echo "The ic repo should be downloaded (in $directory)! Make sure you're using zsh to get direnv and other nice things."