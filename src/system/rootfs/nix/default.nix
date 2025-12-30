{
  config,
  pkgs,
  hydride-overlays,
  ...
}:

{
  imports = [
    ./gc.nix
    ./pkgs.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
