{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.terminals.alacritty;

in {
  imports = [
    ./settings.nix
  ];
  options.modules.terminals.alacritty = { enable = mkEnableOption "alacritty"; };

  config = mkIf cfg.enable {

    programs = {
      alacritty = {
        enable = true;
      };
    };
  };
}
