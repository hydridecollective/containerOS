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

  environment.systemPackages = with pkgs; [
    hcos-update
    hcos-generate
  ];
}
