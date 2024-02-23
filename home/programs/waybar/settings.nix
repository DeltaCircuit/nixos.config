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
          spacing = 4;
          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
          ];

          modules-center = [
            "clock"
          ];

          modules-right = [
            "pulseaudio"
            "network"
            "cpu"
            "memory"
            "tray"
          ];

          # modules-right = [
          #   "idle_inhibitor"
          #   "pulseaudio"
          #   "network"
          #   "cpu"
          #   "memory"
          #   "backlight"
          #   "battery"
          #   "tray"
          #   "wireplumber"
          # ];

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
            icon-size = 21;
          };

          network = {
            "format-wifi" = "{essid} ({signalStrength}%)";
            "tooltip-format" = "{ifname} via {gwaddr}";
            "format-alt" = "{ifname} {ipaddr}/{cidr}";
          };

          # pulseaudio = {
          #   format = "{icon}  {volume}% {format_source}";
          #   format-source = " {volume}%";
          #   format-source-mouted = "";
          #   format-icons = {
          #     headphone = "";
          #     hands-free = "";
          #     headset = "";
          #     phone = "";
          #     portable = "";
          #     car = "";
          #     default = ["" "" ""];
          #   };
          # };
          "pulseaudio" = {
            "format" = "{icon}  {volume}%      {format_source}";
            "format-bluetooth" = "{volume}% {icon} {format_source}";
            "format-bluetooth-muted" = "  {icon}  {format_source}";
            "format-muted" = "   {format_source}";
            "format-source" = "  {volume}%";
            "format-source-muted" = "";
            "format-icons" = {
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = ["" "" ""];
            };
            "on-click" = "pavucontrol";
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
