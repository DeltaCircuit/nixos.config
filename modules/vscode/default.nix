{ inputs, pkgs, lib, config, ...}:

with lib;
let cfg = config.modules.vscode;

in {
  options.modules.vscode = { enable = mkEnableOption "vscode"; };

  config = mkIf cfg.enable {
    programs = {
      vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          eamodio.gitlens
          rust-lang.rust-analyzer
          tamasfe.even-better-toml
          esbenp.prettier-vscode
          pkief.material-icon-theme          
        ];

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
