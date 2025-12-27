{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./networking.nix
    ./whitelabel.nix
  ];
}
