{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.editors.vscode;

in {
  imports = [
    ./extensions.nix
    ./user_settings.nix
  ];
  options.modules.editors.vscode = { enable = mkEnableOption "vscode"; };

  config = mkIf cfg.enable {

    programs = {
      vscode = {
        enable = true;
      };
    };
  };
}
