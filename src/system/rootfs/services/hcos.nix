{
  config,
  pkgs,
  ...
}:

{
  systemd.services.hcos-generate-config = {
    script = ''
      /usr/bin/env hcos-generate
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
