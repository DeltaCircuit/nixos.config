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
            format = "{:%F (%A) %H:%M %Z}";
            timezones = [
              "Asia/Kolkata"
              "US/Central"
            ];
            actions = {
              on-click = "mode";
              on-scroll-up = "tz_up";
              on-scroll-down = "tz_down";
            };
            tooltip-format = "<tt><small>{calendar}</small></tt>";

            calendar = {
              mode = "month";
              on-scroll = 1;
              format = {
                months = "<span color='#ffead3'><b>{}</b></span>";
                days = "<span color='#ecc6d9'><b>{}</b></span>";
                weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
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
