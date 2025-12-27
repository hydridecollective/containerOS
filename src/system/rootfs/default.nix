{
  config,
  pkgs,
  disko,
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
