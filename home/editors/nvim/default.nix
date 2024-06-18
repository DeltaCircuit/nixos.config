{
  inputs,
  config,
  lib,
  ...
}:
with lib;
with inputs; let
  cfg = config.modules.editors.nvim;
in {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  options.modules.editors.nvim = with types; {
    enable = mkEnableOption "enable neovim";
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
