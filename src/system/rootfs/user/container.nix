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

    uid = 1000;

    subUidRanges = [
      {
        startUid = 100000;
        count = 65536;
      }
    ];
    subGidRanges = [
      {
        startGid = 100000;
        count = 65536;
      }
    ];
  };

  users.groups.hydride-containers = {
    gid = 1000;
  };

  environment.shells = lib.mkForce [ pkgs.hcos-shell ];

  system.activationScripts.container-home = {
    text = ''
      mkdir -p /hydride/containers/configs
      mkdir -p /hydride/containers/stacks
      chown -R hydride-containers:hydride-containers /hydride
      HOME=/hydride/containers ${pkgs.git}/bin/git config --global --add safe.directory /hydride/os-meta/hcos
      HOME=/root ${pkgs.git}/bin/git config --global --add safe.directory /hydride/os-meta/hcos
    '';
  };
}
