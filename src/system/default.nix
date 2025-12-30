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
}
