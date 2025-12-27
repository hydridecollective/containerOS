# Hydride containerOS

Nix flakes used for Hydride containerOS.

## Building
```bash
nix --extra-experimental-features "nix-command flakes" build .#iso
```