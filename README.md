# Hydride containerOS

Nix flakes used for Hydride containerOS.

## Building (ISO)
```bash
nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.default.config.system.build.isoImage
```