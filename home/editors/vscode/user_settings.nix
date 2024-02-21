{ inputs, pkgs, lib, config, ...}:

{
  programs = {
    vscode = {
      userSettings = {
        "workbench.colorTheme"= "Nord";
        "window.titleBarStyle"= "custom";
        "workbench.iconTheme"= "material-icon-theme";
        "[nix]"."editor.tabSize" = 2;
        "telemetry.telemetryLevel" = "off";
        "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monspace', monospace";
        "editor.fontLigatures" = true;
        "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
      };
    };
  };
}
