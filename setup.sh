#!/bin/bash

# We assume nix is already installed


echo "Installing home-manager (should be idempotent if it's already installed)"
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install

echo ""
echo "============"
echo ""

# setup `~/.config/home-manager/home.nix`
echo "Creating or overwriting ~/.config/home-manager/home.nix file"
cp home.nix.template ~/.config/home-manager/home.nix
echo "Updating ~/.config/home-manager/home.nix file"
sed -i "s/__USERNAME__/$USER/g" ~/.config/home-manager/home.nix

echo ""
echo "============"
echo ""

home-manager switch # edit `~/.config/home-manager/home.nix` to edit your configuration, then run `home-manager switch` again

echo ""
echo "============"
echo ""

./download.sh
