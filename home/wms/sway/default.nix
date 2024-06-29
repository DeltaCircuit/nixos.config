{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.wms.sway;
in {
  options.modules.wms.sway = {
    enable = mkEnableOption "Enable sway";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      slurp
      wl-clipboard
      mako
    ];

    wayland.windowManager.sway = {
      enable = true;
    };

    xdg.configFile."sway/config".text = builtins.readFile ./config;
  };
}
