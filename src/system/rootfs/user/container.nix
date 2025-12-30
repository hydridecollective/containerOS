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

  system.activationScripts.container-home = {
    text = ''
      chown -R hydride-containers:hydride-containers /hydride
      ${pkgs.git}/bin/git config --global -add safe.directory /hydride/os-meta/hcos
    '';
  };

  environment.systemPackages = with pkgs; [
    zsh
  ];
}
