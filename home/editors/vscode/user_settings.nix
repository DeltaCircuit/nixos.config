{ inputs, pkgs, lib, config, ...}:

{
  programs = {
    vscode = {
      userSettings = {
        "workbench.colorTheme"= "Default Dark Modern";
        "window.titleBarStyle"= "custom";
        "workbench.iconTheme"= "material-icon-theme";
        "[nix]"."editor.tabSize" = 2;
      };
    };
  };
}
