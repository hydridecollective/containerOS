{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./source.nix
    ./gc.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
