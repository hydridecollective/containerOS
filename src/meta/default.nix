{
  config,
  pkgs,
  lib,
  ...
}:

with lib;

{
  options.hydride.containers = {
    version = {
      id = mkOption {
        type = types.str;
        default = "latest";
        description = "ID of the current release. Follows semver, separate from NixOS version.";
      };
      codename = mkOption {
        type = types.str;
        default = "Orca";
        description = "Codename of the current release.";
      };
    };
    images = {
      pull = {
        repository = mkOption {
          type = types.str;
          default = "https://forge.hydride.dev/distro/containerOS.git";
          description = "pull this git repository on image boot/build";
        };
        revision = mkOption {
          type = types.str;
          description = "pull this git revision on image boot/build";
        };
      };
    };
  };

  config.hydride.containers = {
    version = {
      id = "0.2.0";
      codename = "Manatee";
    };
    images.pull = {
      repository = "https://forge.hydride.dev/distro/containerOS.git";
      revision = "39899b183a3336351dd2156de1daeee6ae4a5b64";
    };
  };
}
