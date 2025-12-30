{
  config,
  pkgs,
  disko,
  hydride-overlays,
  ...
}:

{
  imports = [
    ./kernel
    ./user
    ./nix
    ./services
  ];

  system.stateVersion = "25.11";
}
