{ lib,config, ...}:

with lib; let
  cfg = config.modules.services.dunst;

in {
  options.modules.services.dunst = {
    enable = mkEnableOption "Enable dunst";
  };

  config = mkIf cfg.enable {
    services.dunst.enable = true;
  };
}