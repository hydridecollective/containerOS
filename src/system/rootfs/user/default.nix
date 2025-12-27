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
    extraRules = [
      {
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
        groups = [ "wheel" ];
      }
    ];
  };
}
