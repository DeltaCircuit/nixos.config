{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.terminals.tmux;
in {
  options.modules.terminals.tmux = {
    enable = mkEnableOption "Enable tmux";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
    };
  };
}
