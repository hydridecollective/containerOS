{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
    (callPackage ../../../bin/hcos-update/pkg.nix { })
  ];
}
