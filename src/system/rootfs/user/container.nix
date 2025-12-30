{
  config,
  pkgs,
  lib,
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
    shell = pkgs.hcos-shell;
  };

  users.groups.hydride-containers = { };

  environment.shells = lib.mkForce [ pkgs.hcos-shell ];

  system.activationScripts.container-home = {
    text = ''
      chown -R hydride-containers:hydride-containers /hydride
      HOME=/hydride/containers ${pkgs.git}/bin/git config --global --add safe.directory /hydride/os-meta/hcos
      HOME=/root ${pkgs.git}/bin/git config --global --add safe.directory /hydride/os-meta/hcos
    '';
  };
}
