{
  config,
  pkgs,
  ...
}:

{
  # kudos to "https://discourse.nixos.org/t/rootless-podman-compose-configuration/52523/4"
  systemd.services.container-autostart = {
    enable = true;
    after = [
      "podman.service"
      "network-online.target"
    ];
    wants = [ "network-online.target" ];
    requires = [ "podman.service" ];
    description = "Automatically start containers with --restart=always tag";
    serviceConfig = {
      Type = "idle";
      User = "hydride-containers";
      ExecStartPre = ''${pkgs.coreutils}/bin/sleep 1'';
      ExecStart = ''/run/current-system/sw/bin/podman start --all --filter restart-policy=always'';
    };
  };
}
