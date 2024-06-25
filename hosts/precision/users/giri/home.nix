{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../../../home
  ];

  config = {
    modules = {
      installer = {
        packages = [
          "jq"
          "imagemagick"
          "yt-dlp"
          "rclone"
          "fd"
          "gnucash"
          "obsidian"
          "ripgrep"
          "digikam"
          "exiftool"
          "git-credential-manager"
          "pass"
        ];
      };
      browsers = {
        firefox.enable = true;
      };

      editors = {
        vscode.enable = true;
        helix.enable = true;
        # nvim.enable = true;
      };

      programs = {
        fzf.enable = true;
        pcmanfm.enable = true;
        direnv.enable = true;
        rofi.enable = true;
        waybar.enable = true;
        yazi.enable = true;
        gpg.enable = true;
        # starship.enable = true;
      };

      services = {
        blueman-applet.enable = true;
        dunst.enable = true;
        udiskie.enable = true;
        syncthing.enable = true;
      };

      shells = {
        zsh.enable = true;
        zsh.initExtra = ''
          ${lib.fileContents ../../shell_helpers/unlock_data.sh}
          ${lib.fileContents ../../shell_helpers/upgrade.sh}
          ${lib.fileContents ../../shell_helpers/unlock_vault.sh}
          bindkey "^[[1;5C" forward-word
          bindkey "^[[1;5D" backward-word
        '';
      };

      terminals = {
        kitty.enable = true;
        tmux.enable = true;
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
        terminal = "kitty";
      };
    };

    wayland.windowManager.hyprland.config = {
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
