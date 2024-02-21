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
      enableAutosuggestions = true;
      syntaxHighlighting = {
        enable = true;
        #pattern = {"rm -rf *" = "fg=black,bg=red";};
        styles = {"alias" = "fg=magenta";};
        highlighters = ["main" "brackets" "pattern"];
      };

      shellAliases = {
        reload = "(cd $HOME/.config/nixos;home-manager switch --flake .)";
        rebuild = "(cd $HOME/.config/nixos;sudo nixos-rebuild switch --flake .)";
      };

      initExtra = ''
        ${
          if config.modules.programs.yazi.enable
          then lib.fileContents ./helpers/yazi.sh
          else ""
        }
      '';
    };
  };
}
