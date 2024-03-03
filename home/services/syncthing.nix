{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.services.syncthing;
in {
  options.modules.services.syncthing = {
    enable = mkEnableOption "Enable Syncthing";
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      extraOptions = [
        "--gui-address 0.0.0.0"
      ];
    };
  };
}
