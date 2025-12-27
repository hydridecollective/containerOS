{
  config,
  pkgs,
  ...
}:
{
  users.users."hydride-containers" = {
    isSystemUser = true;
    home = "/hydride/containers";
    createHome = true;
    extraGroups = [
      "podman"
      "wheel"
    ];
    group = "hydride-containers";
  };

  users.groups.hydride-containers = { };
}
