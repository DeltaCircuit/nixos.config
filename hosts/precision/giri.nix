{ config, lib, inputs, ...}:

{
  imports = [
    ../../modules/default.nix 
  ];

  config.modules = {
    zsh.enable = true;
    hyprland.enable = false;
    mpd.enable = true;
  };

  home = {
    username = "giri";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
  }
}
