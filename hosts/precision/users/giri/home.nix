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
          "waybar"
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
        #gtk.enable = true;
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
        tmux.enable = true;
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

    home.file = {
      ".icons/Papirus-Dark".source = "${(pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "red";
      })}/share/icons/Papirus-Dark";
      ".themes/Flat-Remix-GTK-Red-Dark".source = "${pkgs.flat-remix-gtk}/share/themes/Flat-Remix-GTK-Red-Dark";
      ".icons/Catppuccin-Mocha-Red".source = pkgs.fetchzip {
        url = "https://github.com/catppuccin/cursors/releases/download/v0.3.1/catppuccin-mocha-red-cursors.zip";
        hash = "sha256-vTdAZdW0bX88rINF4Jv47QKx6G6qym90NXlHwUS865Q=";
      };
    };
  };
}
