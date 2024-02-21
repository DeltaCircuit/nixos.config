{ inputs, pkgs, lib, config, ...}:

{
  imports = [
    ../../modules/default.nix 
  ];

  config.modules = {
    zsh.enable = true;
    hyprland.enable = false;
    mpd.enable = true;
    mpd.runas = "giri";
  };

  home = {
    username = "giri";
    homeDirectory = "/home/giri";
    stateVersion = "23.11";
  };
}
