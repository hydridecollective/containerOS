{
  config,
  pkgs,
  ...
}:

{
  systemd.services.hcos-generate-config = {
    script = ''
      ${(pkgs.callPackage ../../../bin/hcos-generate/pkg.nix { })}/bin/hcos-generate
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
