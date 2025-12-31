{
  config,
  pkgs,
  hydride-overlays,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    zsh
    git
    containers
    hcos-update
    hcos-generate
    hcos-shell
    tmux
  ];
}
