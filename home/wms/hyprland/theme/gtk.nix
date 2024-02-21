{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.wms.hyprland;
in {
  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      font = {
        name = config.my.settings.fonts.regular;
        size = 12;
      };

      theme = {
        name = "Nordic";
        package = pkgs.nordic;
      };

      #iconTheme = {
      #  package = pkgs.papirus-nord.override {
      #    accent = "polarnight3";
      #  };
      #  name = "Papirus-Dark";
      #};

      #gtk3.extraCss = config.gtk.gtk4.extraCss;

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

      # gtk4.extraCss = builtins.readFile ./gtk.css;
    };

    home.sessionVariables.GTK_THEME = "Nordic";

    home.pointerCursor = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
      gtk.enable = true;
    };
  };
}
