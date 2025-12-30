{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./networking.nix
    ./whitelabel.nix
    ./hcos.nix
  ];
}
