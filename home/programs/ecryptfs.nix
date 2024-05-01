{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.ecryptfs;
in {
  options.modules.programs.ecryptfs = {
    enable = mkEnableOption "Enable ecryptfs";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ecryptfs
    ];
  };
}
