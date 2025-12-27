{
  config,
  pkgs,
  modulesPath,
  ...
}:

{
  # we really do nothing here other than add the installation stuff.
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

  environment.etc."hydride/containerOS" = {
    source = builtins.fetchGit {
      url = config.hydride.containers.images.pull.repository;
      rev = config.hydride.containers.images.pull.revision;
    };
  };
}
