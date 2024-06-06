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

        settings = builtins.fromTOML (builtins.readFile ./config.toml);
        languages = builtins.fromTOML (builtins.readFile ./languages.toml);
      };
    };
  };
}
