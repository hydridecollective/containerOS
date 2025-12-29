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
    disk.rootfs = {
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
          ROOTFS = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "@" = {
                  mountpoint = "/";
                };
                "@home" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/home";
                };
                "@nix" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/nix";
                };
              };
            };
          };
        };
      };
    };
    disk.hydride = {
      type = "disk";
      device = mkDefault "/dev/sdb";
      content = {
        type = "gpt";
        partitions = {
          HYDRIDE = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "@hydride" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/hydride";
                };
                "@hydride/os-meta" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/hydride/os-meta";
                };
                "@hydride/containers" = {
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
