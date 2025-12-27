{
  config,
  pkgs,
  ...
}:

{
  environment.etc."hydride/containerOS" = {
    source = builtins.fetchGit {
      url = config.hydride.containers.images.pull.repository;
      rev = config.hydride.containers.images.pull.revision;
    };
  };
}
