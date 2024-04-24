{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.gpg;
in {
  options.modules.programs.gpg = {
    enable = mkEnableOption "Enable GPG support";
  };

  config = mkIf cfg.enable {
    programs.gpg = {
      enable = true;
    };

    services.gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };
}
