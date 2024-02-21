{lib, config, ...}:

with lib; let
  cfg = config.modules.programs.starship;
in {
  imports = [
    ./settings.nix
  ];
  options.modules.programs.starship = {
    enable = mkEnableOption "Enable Starship Promp";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
