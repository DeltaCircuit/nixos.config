{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.editors.helix;
in {
  options.modules.editors.helix = {enable = mkEnableOption "helix";};

  config = mkIf cfg.enable {
    programs = {
      helix = {
        enable = true;
      };
    };
  };
}
