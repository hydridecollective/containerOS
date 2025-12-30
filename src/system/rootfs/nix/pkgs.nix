{
  config,
  pkgs,
  hydride-overlays,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
    hcos-update
    hcos-generate
  ];
}
