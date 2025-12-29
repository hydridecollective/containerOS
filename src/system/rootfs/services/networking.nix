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
    enable = mkDefault false;
    settings = mkDefault {
      PermitRootLogin = mkDefault "no";
      PasswordAuthentication = mkDefault "no";
      KbdInteractiveAuthentication = mkDefault "no";
    };
  };

  services.fail2ban = mkDefault {
    enable = mkDefault true;
    maxretry = mkDefault 5;
    bantime = mkDefault "24h";
  };
}
