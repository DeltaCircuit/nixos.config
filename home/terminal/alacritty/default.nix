{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.terminal.alacritty;

in {
  imports = [
    ./settings.nix
  ];
  options.modules.terminal.alacritty = { enable = mkEnableOption "alacritty"; };

  config = mkIf cfg.enable {

    programs = {
      alacritty = {
        enable = true;
      };
    };
  };
}
