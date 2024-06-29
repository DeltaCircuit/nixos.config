{
  lib,
  config,
  pkgs,
  inputs,
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
      dmenu
      grim
      slurp
      wl-clipboard
      mako
    ];

    wayland.windowManager.sway = {
      enable = true;
    };

    xdg.configFile.sway = {
      source = "${inputs.dotfiles}/sway";
      recursive = true;
    };
  };
}
