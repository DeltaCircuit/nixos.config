{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.vscode;

in {
  options.modules.vscode = { enable = mkEnableOption "vscode"; };

  config = mkIf cfg.enable {
    programs = {
      vscode = {
        enable = true;
      };
    };
  };
}
