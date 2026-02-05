{
  config,
  pkgs,
  lib,
  ...
}:

with lib;

{
  # hostname + nm
  networking.networkmanager.enable = true;
  networking.hostName = "containerOS";

  # ssh
  services.openssh = {
    settings = {
      PermitRootLogin = false;
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "24h";
  };
}
