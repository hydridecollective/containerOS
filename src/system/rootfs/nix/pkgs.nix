{
  config,
  pkgs,
  hydride-overlays,
  ...
}:

{
  nixpkgs.overlays = [
    hydride-overlays.overlays.default
  ];
}
