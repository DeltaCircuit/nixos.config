{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.wms.hyprland;
in {
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = config.modules.wms.hyprland.enable;
      package = pkgs.hyprland;

      reloadConfig = true;
      systemdIntegration = true;
      recommendedEnvironment = true;
      #xwayland.enable = true;

      config = {
        input = {
          kb_layout = "us";
          touchpad = {
            disable_while_typing = false;
            natural_scroll = true;
            scroll_factor = 0.5;
          };
          numlock_by_default = true;
        };

        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          active_border_color = "0xffd8dee9";
          inactive_border_color = "0xff3b4252";
        };

        gestures = {
          workspace_swipe = true;
        };

        decoration = {
          rounding = 5;
        };

        misc = let
          FULLSCREEN_ONLY = 2;
        in {
          vrr = 2;
          # disable_hyprland_logo = true;
          # disable_splash_rendering = true;
          # force_default_wallpaper = 0;
          variable_framerate = true;
          variable_refresh = FULLSCREEN_ONLY;
          disable_autoreload = true;
        };

        env = [
          "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
        ];

        exec_once =
          [
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            #"${pkgs.swaynotificationcenter}/bin/swaync"
            #"${pkgs.kanshi}/bin/kanshi"
            #"${pkgs.nur.repos."999eagle".swayaudioidleinhibit}/bin/sway-audio-idle-inhibit -w"
            #"${pkgs.gammastep}/bin/gammastep"
            #"${pkgs.swaybg}/bin/swaybg -i ${config.my.settings.wallpaper} --mode fill"
            #"${pkgs.trayscale}/bin/trayscale --hide-window"
            #"mullvad-gui"
            #"solaar -w hide"
            "blueman-applet"
            "hyprctl setcursor Nordzy-cursors 24"
          ]
          ++ (
            if config.modules.programs.waybar.enable
            then ["${pkgs.waybar}/bin/waybar"]
            else []
          )
          ++ (
            if config.modules.services.udiskie.enable
            then ["udiskie &"]
            else []
          );
      };
    };
  };

  imports = [
    ./keybindings.nix
    ./windowrules.nix
  ];
}
