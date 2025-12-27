{
  config,
  pkgs,
  ...
}:

{
  environment.etc."issue" = {
    source = pkgs.replaceVars ./resources/issue {
      CONTAINEROS_VERSION = config.hydride.containers.version;
    };
    mode = "0444";
  };
}
