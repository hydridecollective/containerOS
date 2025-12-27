{
  config,
  pkgs,
  disko,
  ...
}:

{
  imports = [
    ./kernel
    ./user
    ./services
  ];
}
