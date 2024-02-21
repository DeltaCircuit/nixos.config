{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.services.blueman;
in {
  options.modules.nixos.services.blueman = {
    enable = mkEnableOption "Enable Blueman and Applet";
  };

  config = mkIf cfg.enable {
    services.blueman.enable = true;
  };
}
