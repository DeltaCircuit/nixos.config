{ lib, config, pkgs, ...}:

with lib; let
  cfg = config.modules.programs.yazi;

in {

  imports = [
    ./theme.nix
    ./settings.nix
  ];
  options.modules.programs.yazi = {
    enable = mkEnableOption "Enable yazi";
  };

  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    home.packages = with pkgs; [
      imagemagick
      file
    ];
  };
}