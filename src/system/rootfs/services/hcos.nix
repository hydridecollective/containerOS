{
  config,
  pkgs,
  ...
}:

{
  systemd.services.hcos-generate-config = {
    script = ''
      ${pkgs.hcos-generate}/bin/hcos-generate
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
