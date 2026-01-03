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
    container
    hcos-update
    hcos-generate
    hcos-shell
    tmux
  ];
}
