{
  config,
  pkgs,
  ...
}:

{
  imports = [

  ];

  virtualisation.containers.storage.settings = {
    storage = {
      driver = "btrfs";
      graphroot = "/hydride/containers/store/graph";
      runroot = "/hydride/containers/store/run";
    };
  };
}
