{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./networking.nix
    ./whitelabel.nix
    ./bin.nix
  ];
}
