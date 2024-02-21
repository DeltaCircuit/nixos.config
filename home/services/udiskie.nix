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
    services.udiskie.enable = true;
    services.udiskie.automount = true;
    services.udiskie.notify = true;
  };
}
