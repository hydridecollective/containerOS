{
  config,
  pkgs,
  disko,
  ...
}:

{
  imports = [
    ./hw
    ./rootfs
    ./containers
  ];
}
