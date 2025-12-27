{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./storage.nix
    ./interface
  ];

  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dnsEnabled = true;
    };
  };

  boot.binfmt = {
    emulatedSystems = [ "aarch64-linux" ];
    preferStaticEmulators = true; 

  environment.systemPackages = with pkgs; [
    podman-compose
    slirp4netns
    fuse-overlayfs
  ];
}
