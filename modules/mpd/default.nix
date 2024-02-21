{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.mpd;

in {
  options.modules.mpd = { enable = mkEnableOption "mpd"; };

  config = mkIf cfg.enable {
    services = {
      mpd = {
        enable = true;
        user = config.home.username;
        extraConfig = ''
          audio_output {
            type "pipewire"
            name "pipewire output"
          }
        ''
      }
    }
  };
}