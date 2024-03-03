{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.services.udiskie;
in {
  options = {
    modules.services.udiskie = {
      enable = mkEnableOption "Enable udiskie";
    };
  };

  config = mkIf cfg.enable {
    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "always";
    };
  };
}
