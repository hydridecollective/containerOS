# Hydride containerOS

Nix flakes used for Hydride containerOS.

## Building
```bash
nix --extra-experimental-features "nix-command flakes" run github:nix-community/nixos-generators --impure -- -f iso --flake .#
```