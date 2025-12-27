{
  config,
  pkgs,
  ...
}:

{
  # enable nm
  networking.networkmanager.enable = true;
  networking.hostName = "containerOS";
}
