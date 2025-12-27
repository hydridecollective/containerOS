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
  };

  users.groups.hydride-containers = { };
}
