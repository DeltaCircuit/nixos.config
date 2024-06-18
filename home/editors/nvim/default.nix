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
  imports = [
    nixvim.homeManagerModules.nixvim
    ./options.nix
    ./plugins
  ];

  options.modules.editors.nvim = with types; {
    enable = mkEnableOption "enable neovim";
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      extraPlugins = with pkgs.vimPlugins; [plenary-nvim];
    };
  };
}
