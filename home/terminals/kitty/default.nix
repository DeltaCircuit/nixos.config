{
  lib,
  config,
  ...
}:
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

      font = {
        name = config.my.settings.fonts.monospace;
      };

      shellIntegration = {
        enableZshIntegration = true;
      };
      theme = "Nord";
    };
  };
}
