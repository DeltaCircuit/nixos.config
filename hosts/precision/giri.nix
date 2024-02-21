{ inputs, pkgs, lib, config, ...}:

{
  imports = [
    ../../home
  ];


  #config = {
  #  modules = {
  #    zsh.enable = true;
  #    hyprland.enable = true;
  #    mpd.enable = true;
  #    mpd.runas = "giri";
  #    vscode.enable = true;
  #    firefox.enable = true;
  #    git.enable = true;
  #  };
  # }

  config = {
    modules = {
      browsers.firefox.enable = true;
      wms.hyprland.enable = true;
      shell.zsh.enable = true;
    };

    my.settings = {
      host = "precision";
      default = {
        shell = "${pkgs.zsh}/bin/zsh";
        browser = "firefox";
        terminal = "alacritty";
      };
    };

    colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

    home = {
      username = "giri";
      homeDirectory = "/home/giri";
      stateVersion = "23.11";
    };
  };
}
