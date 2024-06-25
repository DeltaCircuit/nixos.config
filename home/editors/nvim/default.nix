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
      rev = "794e95fb6c161f532963db77bbfa7924e7c9bf0f";
    };
  };
}
