{
  config,
  pkgs,
  disko,
  hydride-overlays,
  ...
}:

{
  imports = [
    ./hw
    ./rootfs
    ./containers
  ];

  nixpkgs.overlays = [
    hydride-overlays.overlays.default
  ];
}
