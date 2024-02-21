{
  config,
  inputs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.browsers.firefox;
in {
  options.modules.browsers.firefox = {
    enable = mkEnableOption "enable firefox browser";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles.default = {
        name = "firefox_default";
        #name = "${config.home.username}_${config.networking.hostName}";
      };
    };
  };
}
