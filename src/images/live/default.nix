{
  config,
  pkgs,
  ...
}:

{
  # we really do nothing here other than add the installation stuff.
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
}
