{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.pcmanfm;
in {
  options.modules.programs.pcmanfm = {
    enable = mkEnableOption "Enable pcmanfm";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      pcmanfm
    ];
    home.file.".config/pcmanfm/default/pcmanfm.conf".source = ./pcmanfm.conf;
  };
}
