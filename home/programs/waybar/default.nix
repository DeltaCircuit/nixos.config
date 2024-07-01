{
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.programs.waybar;
in {
  options.modules.programs.waybar = {
    enable = mkEnableOption "Enable Waybar";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings.mainBar = builtins.fromJSON (builtins.readFile "${inputs.dotfiles}/waybar/config");
      style = builtins.readFile "${inputs.dotfiles}/waybar/style.css";
      systemd.enable = true;
      systemd.target = "graphical-session-target";
    };
  };
}
