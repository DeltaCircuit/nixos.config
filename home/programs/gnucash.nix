{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.gnucash;
in {
  options.modules.programs.gnucash = {
    enable = mkEnableOption "Enable gnucash";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnucash
    ];
  };
}
