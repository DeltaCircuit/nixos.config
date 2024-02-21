{ lib, config, ...}:

with lib; let 
  cfg = config.modules.nixos.wms.hyprland;

in {
  options.modules.nixos.wms.hyprland = {
    enable = mkEnableOption "Enable Hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland.enable = true;
  };
}