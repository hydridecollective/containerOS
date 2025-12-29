#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p bash disko git
git clone https://forge.hydride.dev/infrastructure/containerOS.git ~/flake
sudo disko --mode disko --flake ~/flake/src#default
sudo nixos-install --no-channel-copy --no-root-password --flake ~/flake/src#default
 