{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.devtools.lsp;
in {
  options.modules.devtools.lsp = {
    typescript = {
      enable = mkEnableOption "helix";
    };

    bash = {
      enable = mkEnableOption "helix";
    };
    terraform = {
      enable = mkEnableOption "helix";
    };
  };

  config = {
    home = {
      packages =
        [
        ]
        ++ (
          if cfg.terraform.enable
          then [pkgs.terraform_ls]
          else []
        )
        ++ (
          if cfg.bash.enable
          then [pkgs.nodePackages_latest.bash-language-server]
          else []
        )
        ++ (
          if cfg.typescript.enable
          then [pkgs.nodePackages_latest.typescript-language-server]
          else []
        );
    };
  };
}
