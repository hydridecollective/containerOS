{
  config,
  pkgs,
  ...
}:

{
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "02:35" ];

  nix.gc = {
    automatic = true;
    dates = [ "02:35" ];
    options = "--delete-older-than +2";
  };
}
