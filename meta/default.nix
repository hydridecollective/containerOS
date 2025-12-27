{
  config,
  pkgs,
  ...
}:

{
  options.hydride.containers = {
    version = mkOption {
      type = types.str;
      default = "latest";
      description = "containerOS Version";
    };
  };

  config.hydride.containers = {
    version = "0.1.0";
  };
}
