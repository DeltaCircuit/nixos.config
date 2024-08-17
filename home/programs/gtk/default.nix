{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.gtk;
in {
  options.modules.programs.gtk = {
    enable = mkEnableOption "Enable gtk";
  };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      name = "catppuccin-mocha-red-cursors";
      package = pkgs.catppuccin-cursors.mochaRed;
      size = 40;
      gtk.enable = true;
    };
    home.sessionVariables.GTK_THEME = "catppuccin-mocha-lavender-standard+normal";
    gtk = {
      enable = true;
      catppuccin = {
        enable = true;
        gnomeShellTheme = true;
      };
      font = {
        name = config.my.settings.fonts.regular;
        size = 12;
      };

      cursorTheme = {
        package = pkgs.catppuccin-cursors.mochaRed;
        name = "catppuccin-mocha-red-cursors";
        size = 40;
      };

      #theme = {
      #  name = "catppuccin-mocha-red-standard+default";
      #  package = pkgs.catppuccin-gtk.override {
      #    accents = ["red"];
      #    variant = "mocha";
      #  };
      #};

      gtk3.extraConfig = {
        gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-decoration-layout = "appmenu:none";
        gtk-button-images = 1;
        gtk-menu-images = 1;
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-error-bell = 0;
        gtk-application-prefer-dark-theme = true;
        gtk-recent-files-max-age = 0;
        gtk-recent-files-limit = 0;
      };

      gtk4.extraConfig = {
        gtk-decoration-layout = "appmenu:none";
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-error-bell = 0;
        gtk-application-prefer-dark-theme = true;
        gtk-recent-files-max-age = 0;
      };
    };
  };
}
