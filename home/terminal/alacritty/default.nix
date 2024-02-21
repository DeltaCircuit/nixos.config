{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.terminal.alacritty;

in {
  options.modules.terminal.alacritty = { enable = mkEnableOption "alacritty"; };

  config = mkIf cfg.enable {

    programs = {
      alacritty = {
        enable = true;

        settings = {
          shell = {
            program = "zsh";
          };

          selection = {
            save_to_clipboard = true;
          };
        };
      };
    };
  };
}
