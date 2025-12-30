{
  config,
  pkgs,
  hydride-overlays,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    hcos-update
    hcos-generate
  ];
}
