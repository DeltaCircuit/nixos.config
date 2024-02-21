{ lib, config, pkgs, ...}:

with lib; let
  cfg = config.modules.programs.fd;

in {
  options.modules.programs.fd = {
    enable = mkEnableOption "Install fd";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fd
    ];
  };
}