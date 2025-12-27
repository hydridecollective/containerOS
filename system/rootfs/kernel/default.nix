{
  config,
  pkgs,
  modulesPath,
  lib,
  ...
}:

with lib;

{
  imports = [
    ./modules.nix
    ./sysctl.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = mkDefault [ ];
}
