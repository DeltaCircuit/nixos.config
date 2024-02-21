{lib, config, ...}:

with lib; let
  cfg = config.modules.programs.waybar;

in {

  config = mkIf cfg.enable {
    programs.waybar ={
      settings = [{
        layer = "top";
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-center = [];

        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "backlight"
          "battery"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          disable-scroll = true;
          all-outputs = true;
          show-special = true;
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
          separate-outputs = true;
          "max-length" =  200;
        };

        tray = {
          spacing = 10;
        };

      }];
    };
  };
}

