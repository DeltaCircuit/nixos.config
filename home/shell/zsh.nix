{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shells.zsh;
in {
  options.modules.shells.zsh = {
    enable = mkEnableOption "enable zsh configuration";
  };

  config = mkIf cfg.enable {
    programs.zsh = mkIf cfg.enable {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting = {
        enable = true;
        patterns = {"rm -rf *" = "fg=black,bg=red";};
        styles = {"alias" = "fg=magenta";};
        highlighters = ["main" "brackets" "pattern"];
      };
    };
  };
}
