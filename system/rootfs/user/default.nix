{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./container.nix
  ];

  users.groups = {
    wheel = { };
  };

  security.sudo = {
    enable = true;
    groups = [ "wheel" ];
  };
}
