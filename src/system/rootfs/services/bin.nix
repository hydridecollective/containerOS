{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
    (callPackage ../../../bin/hcos-update/pkg.nix { })
    (callPackage ../../../bin/hcos-generate/pkg.nix { })
  ];
}
