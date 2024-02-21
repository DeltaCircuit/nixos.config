{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.editors.vscode;

in {
  options.modules.editors.vscode = { enable = mkEnableOption "vscode"; };

  config = mkIf cfg.enable {

    imports = [
      ./extensions.nix
      ./user_settings.nix
    ];
    programs = {
      vscode = {
        enable = true;

        userSettings = {
          "workbench.colorTheme"= "Default Dark Modern";
          "window.titleBarStyle"= "custom";
          "workbench.iconTheme"= "material-icon-theme";
          "[nix]"."editor.tabSize" = 2;
        };
      };
    };
  };
}
