{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.ripgrep;
in {
  options.modules.programs.ripgrep = {
    enable = mkEnableOption "Install ripgrep";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ripgrep
    ];
  };
}
