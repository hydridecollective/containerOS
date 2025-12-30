{
  config,
  pkgs,
  ...
}:

{
  environment.etc."issue" = {
    source = pkgs.replaceVars ./resources/issue {
      CONTAINEROS_VERSION = config.hydride.containers.version.id;
    };
    mode = "0444";
  };

  services.getty.autologinUser = "hydride-containers";
}
