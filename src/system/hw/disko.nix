{
  config,
  pkgs,
  modulesPath,
  lib,
  disko,
  ...
}:

with lib;

{
  disko.devices = {
    disk.disk1 = {
      type = "disk";
      device = mkDefault "/dev/sda";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            type = "EF00";
            size = "500M";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          ROOT = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "/rootfs" = {
                  mountpoint = "/";
                };
                "/home" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/home";
                };
                "/nix" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/nix";
                };
                "/hydride" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/hydride";
                };
                "/hydride/containers" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/hydride/containers";
                };
              };
            };
          };
        };
      };
    };
  };
}
