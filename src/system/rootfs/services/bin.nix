{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (import ../../../bin/hcos-update/pkg.nix)
  ];
}
