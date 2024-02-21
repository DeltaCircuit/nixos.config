{ lib, config, ...}:

with lib; let
  cfg = config.modules.services.blueman-applet;

in {
  options.modules.services.blueman-applet = {
    enable = mkEnableOption "Enable Blueman Applet";
  };

  config = mkIf cfg.enable {
    services.blueman-applet.enable = true;
  };
}