{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.ffmpeg;
in {
  options.modules.programs.ffmpeg = {
    enable = mkEnableOption "Enable ffpmeg";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ffmpeg
    ];
  };
}
