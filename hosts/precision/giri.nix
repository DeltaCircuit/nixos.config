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
      editors.vscode.enable = true;
      terminal.alacritty.enable = true;
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

    wayland.windowManager.hyprland.settings =  {
      monitor = [
        "DP-3,1920x1080,0x0,1"
        "eDP-1,1920x1080,1920x0,1"
      ];
    };

    home = {
      username = "giri";
      homeDirectory = "/home/giri";
      stateVersion = "23.11";
    };
  };
}
