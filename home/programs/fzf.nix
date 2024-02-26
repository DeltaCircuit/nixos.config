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

      colors = {
        "bg+" = "#313244";
        bg = "#1e1e2e";
        spinner = "#f5e0dc";
        hl = "#f38ba8";
        fg = "#cdd6f4";
        header = "#f38ba8";
        info = "#cba6f7";
        pointer = "#f5e0dc";
        marker = "#f5e0dc";
        "fg+" = "#cdd6f4";
        prompt = "#cba6f7";
        "hl+" = "#f38ba8";
      };
    };
  };
}
