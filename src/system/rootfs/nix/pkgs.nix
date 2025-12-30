{
  config,
  pkgs,
  inputs,
  ...
}:

{
  nixpkgs.overlays = [
    inputs.hydride-overlays.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    hcos-update
    hcos-generate
  ];
}
