{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "23.11";
  
  imports = [
    ./zsh
    ./hyprland
    ./mpd
    ./vscode
    ./firefox
    ./git
  ];
}
