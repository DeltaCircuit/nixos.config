{ inputs, pkgs, lib, config, ...}:

{
  programs = {
    vscode = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        eamodio.gitlens
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        esbenp.prettier-vscode
        pkief.material-icon-theme          
      ];
  };
};
}
