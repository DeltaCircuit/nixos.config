{...}: {
  programs = {
    vscode = {
      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
        "window.titleBarStyle" = "custom";
        "workbench.iconTheme" = "catppuccin-mocha";
        "[nix]"."editor.tabSize" = 2;
        "telemetry.telemetryLevel" = "off";
        "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monspace', monospace";
        "editor.fontLigatures" = true;
        "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
      };
    };
  };
}
