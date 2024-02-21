{ inputs, pkgs, lib, config, ...}:

{
  imports = [
    ../../home
  ];

  config = {
    modules = {

      browsers = {
        firefox.enable = true;
      };

      editors = {
        vscode.enable = true;
      };

      programs = {
        fzf.enable = true;
        pcmanfm.enable = true;
        direnv.enable = true;
        rofi.enable = true;
        waybar.enable = true;
        rclone.enable = true;
      };

      services = {
        blueman-applet.enable = true;
        dunst.enable = true;
        udiskie.enable = true;
      };

      shells = {
        zsh.enable = true;
      };

      terminals = {
        alacritty.enable = true;
      };

      wms = {
        hyprland.enable = true;
      };
    };

    my.settings = {
      host = "precision";
      default = {
        shell = "${pkgs.zsh}/bin/zsh";
        browser = "firefox";
        terminal = "alacritty";
      };
    };

    wayland.windowManager.hyprland.config =  {
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
