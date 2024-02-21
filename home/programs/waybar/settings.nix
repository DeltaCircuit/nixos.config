{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.programs.waybar;
in {
  config = mkIf cfg.enable {
    programs.waybar = {
      settings = [
        {
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
            "max-length" = 200;
          };

          tray = {
            spacing = 10;
          };

          network = {
            "format-wifi" = "{essid} ({signalStrength}%)";
            "tooltip-format" = "{ifname} via {gwaddr}";
            "format-alt" = "{ifname} {ipaddr}/{cidr}";
          };

          pulseaudio = {
            format = "{icon}  {volume}% {format_source}";
            format-source = " {volume}%";
            format-source-mouted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
          };

          clock = {
            format = "{:%F %H:%M %Z}";
            timezones = [
              "Asia/Kolkata"
              "US/Central"
            ];
            actions = {
              on-scroll-up = "tz_up";
              on-scroll-down = "tz_down";
            };
            tooltip-format = "{:%Y-%m-%d}";
          };

          battery = {
            design-capacity = true;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon}      {capacity}%";
            format-plugged = "  {capacity}%";
            format-charging = "  {capacity}%";
            format-icons = ["" "" "" "" ""];
            format-alt = "{time}      {icon}";
          };
        }
      ];
    };
  };
}
