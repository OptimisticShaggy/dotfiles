#! /run/current-system/sw/bin/bash

sudo nix flake update
git add .
git commit
sudo nixos-rebuild switch --flake ./#estushlpse --impure