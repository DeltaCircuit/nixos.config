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
      wmenu
    ];

    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = null;
      extraConfig = lib.fileContents "${inputs.dotfiles}/sway/config";
    };
  };
}
