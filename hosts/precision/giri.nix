{ inputs, pkgs, lib, config, ...}:

{
  imports = [
    ../../modules/default.nix 
  ];


  config = {
    modules = {
      zsh.enable = true;
      hyprland.enable = true;
      mpd.enable = true;
      mpd.runas = "giri";
      vscode.enable = true;
      firefox.enable = true;
      git.enable = true;
    };

    nixpkgs.config.allowUnfree = true;

    home = {
      username = "giri";
      homeDirectory = "/home/giri";
      stateVersion = "23.11";
    };
  };
}
