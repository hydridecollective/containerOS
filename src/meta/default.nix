{
  config,
  pkgs,
  lib,
  ...
}:

with lib;

{
  options.hydride.containers = {
    version = mkOption {
      type = types.str;
      default = "latest";
      description = "containerOS Version";
    };
    images = {
      pull = {
        repository = mkOption {
          type = types.str;
          default = "https://forge.hydride.dev/infrastructure/containerOS.git";
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
    version = "0.1.0";
    images.pull = {
      repository = "https://forge.hydride.dev/infrastructure/containerOS.git";
      revision = "39899b183a3336351dd2156de1daeee6ae4a5b64";
    };
  };
}
