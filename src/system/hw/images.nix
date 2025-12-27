{
  pkgs,
  modulesPath,
  lib,
  ...
}:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  system.activationScripts.copyFlake = {
    text = ''
      mkdir -p /etc/nixos/flake
      cp -r ${toString ../../.} /etc/nixos/flake/
    '';
  };
}
