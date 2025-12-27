{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options = {
    system.nixos = {
      distroName = lib.mkOption { apply = _: "hydride containerOS"; };
      distroId = lib.mkOption { apply = _: "hcos"; };
      vendorId = lib.mkOption { apply = _: "hydride"; };
      vendorName = lib.mkOption { apply = _: "Hydride Collective"; };
      codeName = lib.mkOption { apply = _: "Orca"; };
      extraOSReleaseArgs = lib.mkOption {
        apply = _: {
          CONTAINEROS_VERSION = config.hydride.containers.version.id;
          HOME_URL = "https://forge.hydride.dev/infrastructure/containerOS";
          VENDOR_URL = "https://hydride.dev";
        };
      };
    };
  };
}
