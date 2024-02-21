{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.programs.direnv;
in {
  options.modules.programs.direnv = {
    enable = mkEnableOption "Enable direnv Integration";
  };

  config = mkIf cfg.enable {
    programs.direnv = mkIf cfg.enable {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
