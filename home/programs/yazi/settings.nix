{ lib, config, ...}:

with lib; let
  cfg = config.modules.programs.yazi;

in {

  config = mkIf cfg.enable {
    programs.yazi.settings = {
    };
  };
}