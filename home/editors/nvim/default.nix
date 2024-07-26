{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with inputs; let
  cfg = config.modules.editors.nvim;
in {
  options.modules.editors.nvim = with types; {
    enable = mkEnableOption "enable neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
    };

    #    xdg.configFile.nvim = {
    #      source = "${inputs.dotfiles}/nvim";
    #      recursive = true;
    #    };
  };
}
