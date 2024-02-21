{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.zsh;
in {
  options.modules.nixos.zsh = {
    enable = mkEnableOption "Enable ZSH";
  };

  config = mkIf cfg.enable {
    
  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

    programs = {
      zsh = {
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

  };
}
