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
      PermitRootLogin = "no";
      PasswordAuthentication = "no";
      KbdInteractiveAuthentication = "no";
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "24h";
  };
}
