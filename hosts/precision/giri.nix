{ inputs, pkgs, lib, config, ...}:

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
    username = lib.mkDefault "giri";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "23.11";
  };
}
