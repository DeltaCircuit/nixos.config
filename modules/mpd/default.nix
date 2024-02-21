{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.mpd;
in {
  options = {
    modules = {
      mpd = {
        enable = mkEnableOption "mpd";
        runas = lib.mkOption {
          default = "root";
          description = ''
            Which user should the MPD run as?
          '';
        };
      };
    };
  };

  config = mkIf cfg.enable {
    services = {
      mpd = {
        enable = true;
        musicDirectory = "/home/${cfg.runas}/music";
        extraConfig = ''
          audio_output {
            type "pipewire"
            name "pipewire output"
          }
        '';
      };
    };
  };
}
