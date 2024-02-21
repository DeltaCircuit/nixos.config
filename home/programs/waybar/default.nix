{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.programs.waybar;
in {
  imports = [
    ./settings.nix
  ];

  options.modules.programs.waybar = {
    enable = mkEnableOption "Enable Waybar";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      systemd.target = "graphical-session-target";
    };
  };
}
