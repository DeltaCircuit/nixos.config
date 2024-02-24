{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.exiftool;
in {
  options.modules.programs.exiftool = {
    enable = mkEnableOption "Enable exiftool";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      exiftool
    ];
  };
}
