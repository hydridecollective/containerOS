{
  config,
  pkgs,
  ...
}:

{
  systemd.services.hcos-generate-config = {
    script = ''
      # clone repo if it doesn't exist
      [ ! -d /etc/hydride/containerOS ] && git clone ${config.hydride.containers.images.pull.repository} /etc/hydride/containerOS
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
