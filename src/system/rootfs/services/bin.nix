{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (callPackage ../../../bin/hcos-update/pkg.nix { })
  ];
}
