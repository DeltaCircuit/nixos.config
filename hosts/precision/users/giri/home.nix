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
          "alejandra"
          "vlc"
          "bemenu"
          "foot"
          "wl-clipboard"
          "python311"
          "gcc"
          "gnumake"
        ];
      };
      browsers = {
        firefox.enable = true;
      };

      editors = {
        vscode.enable = true;
        helix.enable = true;
        nvim.enable = true;
      };

      programs = {
        fzf.enable = true;
        pcmanfm.enable = true;
        direnv.enable = true;
        yazi.enable = true;
        gpg.enable = true;
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
        sway.enable = true;
      };
    };

    my.settings = {
      host = "precision";
      default = {
        shell = "${pkgs.zsh}/bin/zsh";
        browser = "firefox";
        terminal = "foot";
      };
    };

    home = {
      username = "giri";
      homeDirectory = "/home/giri";
      stateVersion = "23.11";
    };
  };
}
