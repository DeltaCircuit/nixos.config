{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.zsh;

in {
  options.modules.zsh = { enable = mkEnableOption "zsh"; };

  config = mkIf cfg.enable {
    home.packages = [ 
      pkgs.zsh
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutoSuggestions = true;
      enableSyntaxHighlighting = true;
    };
  };
}
