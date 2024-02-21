{ lib, config, ...}:

with lib; let
  cfg = config.modules.terminals.kitty;

in {
  options.modules.terminals.kitty = {
    enable = mkEnableOption "Enable kitty";
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      # environment = {};

      # font = {};
      shellIntegration = {
        enableZshIntegration = true;
      };
    };
  };
}