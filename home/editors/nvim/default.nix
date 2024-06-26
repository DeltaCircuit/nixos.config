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
  #imports = [
  #  nixvim.homeManagerModules.nixvim
  #  ./options.nix
  #  ./plugins
  #  ./colorschems/catppuccin_mocha.nix
  #  ./startup.nix
  #];

  options.modules.editors.nvim = with types; {
    enable = mkEnableOption "enable neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      # defaultEditor = true;
      #extraPlugins = with pkgs.vimPlugins; [plenary-nvim];

      # extraConfigLua = builtins.readFile ./reload.lua;
    };

    xdg.configFile.nvim.source = builtins.fetchGit {
      url = "https://github.com/homelabx/nvim.config.git";
      rev = "e6e69cfc390b19a84b23b687e0ea5ff45d92f394";
    };
  };
}
