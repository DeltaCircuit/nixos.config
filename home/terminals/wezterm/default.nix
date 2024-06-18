{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.terminals.wezterm;
in {
  options.modules.terminals.wezterm = {
    enable = mkEnableOption "Enable wezterm";
  };

  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = true;

      #enableZshIntegration = true;
    };
  };
}
