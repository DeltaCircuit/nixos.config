{ lib, config, pkgs, ...}:

with lib; let 

  cfg = config.modules.programs.rclone;

in {
  options.modules.programs.rclone = {
    enable = mkEnableOption "Enable rclone";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rclone
    ];
  };
}