{
  config,
  pkgs,
  ...
}:

{
  system.nixos = {
    distroName = "hydride containerOS";
    distroId = "hcos";
    vendorId = "hydride";
    vendorName = "Hydride Collective";
    codeName = config.hydride.containers.version.codename;
    extraOSReleaseArgs = {
      CONTAINEROS_VERSION = config.hydride.containers.version.id;
      HOME_URL = "https://forge.hydride.dev/infrastructure/containerOS";
      VENDOR_URL = "https://hydride.dev";
    };
  };
}
