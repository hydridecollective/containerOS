{
  config,
  pkgs,
  ...
}:
{
  users.users."hydride-containers" = {
    isNormalUser = true;
    home = "/hydride/containers";
    createHome = true;
    extraGroups = [
      "podman"
      "wheel"
      "networkmanager"
    ];
    group = "hydride-containers";
    shell = pkgs.zsh;
  };

  users.groups.hydride-containers = { };

  environment.systemPackages = with pkgs; [
    zsh
  ];
}
