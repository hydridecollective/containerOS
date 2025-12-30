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
    hcos-update
    hcos-generate
    hcos-shell
    tmux
  ];
}
