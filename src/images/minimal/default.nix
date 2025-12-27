{
  config,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

  # pull the containerOS flake
  environment.etc."hydride/containerOS" = {
    source = builtins.fetchGit {
      url = config.hydride.containers.images.pull.repository;
      rev = config.hydride.containers.images.pull.revision;
    };
  };
}
