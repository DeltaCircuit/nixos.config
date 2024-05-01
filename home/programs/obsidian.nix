{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.obsidian;
in {
  options.modules.programs.obsidian = {
    enable = mkEnableOption "Enable obsidian";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
