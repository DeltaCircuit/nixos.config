{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  programs = {
    vscode = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        eamodio.gitlens
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        esbenp.prettier-vscode
        jnoortheen.nix-ide
        kamadorueda.alejandra
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
      ];
    };
  };
}
