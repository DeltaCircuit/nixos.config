{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.programs.fzf;
in {
  options.modules.programs.fzf = {
    enable = mkEnableOption "Enable FZF Integration";
  };

  config = mkIf cfg.enable {
    programs.fzf = mkIf cfg.enable {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
